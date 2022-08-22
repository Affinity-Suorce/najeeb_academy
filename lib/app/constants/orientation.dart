import 'package:flutter/services.dart';

abstract class AppOrientation {
  static const defaultOrientation = [
    DeviceOrientation.portraitUp,
  ];
  static const videoPageOrientation = [
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ];
}
