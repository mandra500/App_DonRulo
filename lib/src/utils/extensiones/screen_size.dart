import 'package:flutter/material.dart';

// Extension for responsive screen size
extension ScreenSize on BuildContext {
  double getScreenWidth({double? multiplier}) {
    var width = MediaQuery.of(this).size.width;
    if (multiplier != null) {
      width *= multiplier;
    }
    return width; // Return the width of the screen
  }

  double getScreenHeight({double? multiplier}) {
    var height = MediaQuery.of(this).size.height;
    if (multiplier != null) {
      height *= multiplier;
    }
    return height; // Return the height of the screen
  }
}
