import 'package:flutter/material.dart';
import 'package:td_dos/UI/home.dart';
import 'package:td_dos/UI/mytheme.dart';
import 'package:td_dos/modele/myTD2.dart';

void main() => runApp(
  MaterialApp(
    theme: MyTheme.dark(),
    debugShowCheckedModeBanner: false,
    title: 'TD2',
    home: MyTD2(),
  ),
);