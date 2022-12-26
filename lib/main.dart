import 'package:flutter/material.dart';
import 'package:worldtime1/pages/home.dart';
import 'package:worldtime1/pages/choose_location.dart';
import 'package:worldtime1/pages/loading.dart';
void main() =>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    brightness: Brightness.dark,
  ),

  //theme: ThemeData(colorScheme: Colors.red[400]),
  initialRoute: '/',
  routes: {
    '/': (context)=>loading(),
    '/home': (context)=>home(),
    '/location': (context)=>Choose_location(),
  },
));




