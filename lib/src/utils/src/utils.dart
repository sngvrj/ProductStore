import 'package:flutter/material.dart';
import 'package:store_app/src/utils/src/ui_dimens.dart';

class Utils {
  static double getScreenWidth(BuildContext context, double y) {
    return context.screenWidth * (y / 411.0);
  }

  static double getScreenHeight(BuildContext context, double y) {
    return context.screenHeight * (y / 843.0);
  }

  static double getAllSize(double z, BuildContext? context) {
    return (context!.screenWidth * context.screenHeight) * (z / (411 * 843));
  }
}
