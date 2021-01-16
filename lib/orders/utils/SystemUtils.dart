import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class SystemUtils {
  static double _screenWidth;
  static double _screenHeight;

  //获取屏幕高度
  static double getDevicesHeight() {
    MediaQueryData data = MediaQueryData.fromWindow(ui.window);
    _screenWidth = data.size.width;
    _screenHeight = data.size.height;
    return _screenHeight;
  }

  //获取屏幕宽度
  static double getDevicesWidth() {
    getDevicesHeight();
    return _screenWidth;
  }

  //获取屏幕高度
  static double getDevicesHeightWithContext(BuildContext context) {
    final size =MediaQuery.of(context).size;
    _screenWidth = size.width;
    _screenHeight = size.height;
    return _screenHeight;
  }

  //获取屏幕宽度
  static double getDevicesWidthWithContext(BuildContext context) {
    getDevicesHeightWithContext(context);
    return _screenWidth;
  }
}
