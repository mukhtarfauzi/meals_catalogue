import 'package:flutter/material.dart';
import 'package:meals_catalogue/app.dart';
import 'package:meals_catalogue/config.dart';

void main() {
  Config.appFlavor = Flavor.DEVELOPMENT;
  runApp(new MyApp());
}