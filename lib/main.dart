import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ownnotess/screens/AddNotes.dart';
import 'package:ownnotess/screens/home.dart';
import 'package:ownnotess/screens/listNotes.dart';
import 'package:ownnotess/screens/setting.dart';
import 'package:ownnotess/utils/dark_mode.dart';
import 'package:ownnotess/utils/root.dart';

import 'controllers/readdata.dart';



class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState(){
    super.initState();
    readData();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Note',
      initialRoute:'/home',
      routes: {
        '/home':(context)=>HomePage(),
        '/AddNotePage': (context) => AddNotePage(),
        '/Setting': (context) => Setting(),
        '/DarkMode': (context) => DarkMode(),
        '/NoteList': (context) => NoteList(),

      },
    );
  }
}

void main() async {
  runApp(MyApp());
}
//
// class MyAppss extends StatelessWidget {
//   const MyAppss({Key? key}): super(key:key);
//
//
//   @override
//
// }