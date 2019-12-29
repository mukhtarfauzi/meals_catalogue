import 'package:flutter/material.dart';

enum Flavor {
  DEVELOPMENT,
  RELEASE,
}

class Config {

  static Flavor appFlavor;

  static String get helloMessage {
    switch (appFlavor) {
      case Flavor.RELEASE:
        return 'RELEASE';
      case Flavor.DEVELOPMENT:
      default:
        return 'DEVELOPMENT';
    }
  }

  static Icon get helloIcon {
    switch (appFlavor) {
      case Flavor.RELEASE:
        return new Icon(Icons.new_releases);
      case Flavor.DEVELOPMENT:
      default:
        return new Icon(Icons.developer_mode);
    }
  }

  static Color get configColor {
    switch (appFlavor) {
      case Flavor.RELEASE:
        return new Color(0xFFFFAB40);
      case Flavor.DEVELOPMENT:
      default:
        return Colors.blue;
    }
  }
}