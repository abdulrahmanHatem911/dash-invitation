import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// list for data
List<Map> listData = [];
dynamic defultColor = HexColor('2d767f');
ThemeData lightTheme = ThemeData(
  fontFamily: 'cairo',
  primarySwatch: Colors.grey,
  scaffoldBackgroundColor: HexColor('ecfffb'),
  appBarTheme: AppBarTheme(
    backgroundColor: HexColor("2d767f"),
    elevation: 0.0,
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
);
