import 'package:flutter/material.dart';
import 'package:flutter_ecomm/Pages/login.dart';
import 'package:flutter_ecomm/Pages/home.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Colors.red.shade900
    ),
    home: Login(),
  ));
}