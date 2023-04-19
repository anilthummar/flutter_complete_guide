

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';


Widget loadSvg(     
    {String path = "", Color? color, 
      BoxFit fit = BoxFit.contain, Size? size}) {
    return path.isEmpty
        ? SvgPicture.asset(
      path,
      height: size?.height,
      width: size?.width,
      // color: color,
      fit: fit,
    )
        : Container();
  }
  


