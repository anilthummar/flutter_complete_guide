import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final double value;
  final double minValue;
  final double maxValue;
  final int majorTick;
  final int minorTick;
  final Function(double)? onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final int labelValuePrecision;
  final int tickValuePrecision;
  final bool linearStep;
  final List<double>? steps;

  CustomSlider({
    required this.value,
    required this.minValue,
    required this.maxValue,
    required this.majorTick,
    required this.minorTick,
    required this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.labelValuePrecision = 2,
    this.tickValuePrecision = 1,
    this.linearStep = true,
    this.steps,
  });

  @override
  Widget build(BuildContext context) {
    final allocatedHeight = MediaQuery.of(context).size.height;
    final allocatedWidth = MediaQuery.of(context).size.width;
    final divisions = (majorTick - 1) * minorTick + majorTick;
    final double valueHeight =
        allocatedHeight * 0.05 < 41 ? 41 : allocatedHeight * 0.05;
    final double tickHeight =
        allocatedHeight * 0.025 < 20 ? 20 : allocatedHeight * 0.025;
    final labelOffset = allocatedWidth / divisions / 2;

    return Column(
      children: [
        Padding(
          // padding: EdgeInsets.symmetric(horizontal: labelOffset),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SliderTheme(
            data: SliderThemeData(
              trackHeight:
                  allocatedHeight * 0.011 < 9 ? 9 : allocatedHeight * 0.011,
              activeTickMarkColor: activeColor ?? Colors.orange,
              inactiveTickMarkColor: inactiveColor ?? Colors.orange.shade50,
              activeTrackColor: activeColor ?? Colors.orange,
              inactiveTrackColor: inactiveColor ?? Colors.orange.shade50,
              thumbColor: activeColor ?? Colors.orange,
              overlayColor: activeColor == null
                  ? Colors.orange.withOpacity(0.1)
                  : activeColor!.withOpacity(0.1),
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
              trackShape: CustomTrackShape(),
              showValueIndicator: ShowValueIndicator.never,
              valueIndicatorTextStyle: TextStyle(
                fontSize: 12,
              ),
            ),
            child: Slider(
              value: value,
              min: minValue,
              max: maxValue,
              divisions: divisions - 1,
              onChanged: onChanged,
              label: value.toStringAsFixed(labelValuePrecision),
            ),
          ),
        ),
        Row(
          children: List.generate(
            divisions,
                (index) => Expanded(
              child: Column(
                children: [
                  // Container(
                  //   alignment: Alignment.bottomCenter,
                  //   // height: valueHeight,
                  //   child: index % (minorTick + 1) == 0
                  //       ? Text(""
                      // linearStep
                      //     ? '${(index / (divisions - 1) * maxValue).toStringAsFixed(tickValuePrecision)}'
                      //     : '${(steps?[index])?.toStringAsFixed(tickValuePrecision)}',
                      // style: TextStyle(
                      //   fontSize: 12,
                      // ),
                      // textAlign: TextAlign.center,
                  //   )
                  //       : null,
                  // ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 3,
                    child: VerticalDivider(
                      //indent: index % (minorTick + 1) == 0 ? 2 : 6,
                      thickness: 2.5,
                      color: Colors.grey.shade300,


                      // color: (index / (divisions - 1)) * maxValue == value
                      //     ? activeColor ?? Colors.orange
                      //     : Colors.grey.shade300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
