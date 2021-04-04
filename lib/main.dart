import 'package:flutter/material.dart';
import 'package:world_time/Pages/choose_loacation.dart';
import 'package:world_time/Pages/home.dart';
import 'package:world_time/Pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context) => Loading(),
      '/home' : (context) => home(),
      '/location' : (context) => ChooseLocation()
    },
  ));
}

