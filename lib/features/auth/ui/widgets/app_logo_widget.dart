import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/assets_path.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key,
    this.height,
    this.width,
    this.boxFit,
  });
  final double? height, width;
  final BoxFit? boxFit;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetsPath.appLogoSvg,
      width: width??120,
      height: height??120,
      fit: boxFit ?? BoxFit.scaleDown,
    );
  }
}
