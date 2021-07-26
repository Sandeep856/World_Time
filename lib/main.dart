import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => SafeArea(child: Loading()),
      '/home': (context) => Home(),
      '/location': (context) => SafeArea(child: ChooseLocation()),
    },
  ));
}
