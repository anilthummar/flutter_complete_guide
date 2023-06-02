import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../HomeScreen.dart';
import '../utils/AppColors.dart';
import '../utils/MyCustomButtonWidget.dart';

class SearchHomeClub extends StatefulWidget {
  const SearchHomeClub({Key? key}) : super(key: key);

  @override
  _SearchHomeClub createState() => _SearchHomeClub();
}

class _SearchHomeClub extends State<SearchHomeClub> {
  TextEditingController mController = TextEditingController();
  late GoogleMapController myController;
  final LatLng _center = const LatLng(45.521563, -122.677433);
  final MapType _currentMapType = MapType.normal;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  var _height=0.0, _width=0.0;

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(256, 256)), "assets/images/placeholder.png",
    ).then(
          (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    myController = controller;
  }

  @override
  void initState() {
    super.initState();
    addCustomIcon();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              //title and back arrow
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Align(
                            child: SvgPicture.asset(
                                color: AppColors.colorBlack,
                                'assets/images/ic_back.svg')),
                      ),
                    ),
                    const Expanded(
                      flex: 9,
                      child: Text(
                        "Search Home Club",
                        style: TextStyle(
                            fontSize: 17,
                            color: AppColors.btnColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  cursorColor: AppColors.colorGray,
                  // onChanged: (value) => _runFilter(value),
                  controller: mController,
                  decoration: InputDecoration(
                    hintText: "Search Home Club",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.appColor,
                      ),
                    ),
                    disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.colorGray,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.appColor,
                      ),
                    ),
                    prefixIcon: IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: AppColors.colorGray,
                      ),
                      onPressed: () {},
                    ),

                  ),
                ),
              ),
              Expanded(
                child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 14.0,
                    ),
                    mapType: _currentMapType,
                    markers: {
                      Marker(
                        markerId: const MarkerId("marker1"),
                        position:  LatLng(_center.latitude,_center.longitude),
                        draggable: true,
                        onDragEnd: (value) {
                          // value is the new position
                        },
                        icon: markerIcon,
                        // To do: custom marker icon
                      ),

                    },

                ),

              ),
              //button finish
              Container(
                width: double.maxFinite,
                height: 50,
                margin: const EdgeInsets.all(10),
                child: MyCustomButtonWidget(
                  'Finish',
                  onTap: () {
                    _width=MediaQuery.of(context).size.width;
                    _height=MediaQuery.of(context).size.height;
                    openAlertBox(_height,_width);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future openAlertBox(double _height,double _width) {

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0,),),),
            contentPadding: const EdgeInsets.only(top: 10.0),
            content: Container(
              alignment: AlignmentDirectional.center,
              width: _width * 15.5,
              height: _height / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      // Image
                      SvgPicture.asset(
                        // color: AppColors.colorBlack,
                          'assets/images/dialog_done.svg'),
                      const SizedBox(height: 20),
                      const Text("Thank you for adding a New Home club \n onto the platform.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.colorGray,fontWeight: FontWeight.normal,
                          fontSize: 15,fontFamily: 'Poppins-Regular'),),

                      const SizedBox(height: 10),
                      //Button Ok
                      Container(
                        width: 222,
                        height: 40,
                        margin: const EdgeInsets.all(10),
                        child: MyCustomButtonWidget(
                          'Ok',
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),),);
                          },
                        ),
                      ),
                    ],
                  ),
                    ],
          ),),);
        });

  }
}
