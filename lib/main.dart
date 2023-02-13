
import 'package:contact_diary/Onclick.dart';
import 'package:contact_diary/adcontact.dart';
import 'package:contact_diary/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
     // initialRoute: 'add',
      routes: {
        '/':(context)=>Homescreen(),
        'add':(context)=>Addcontact(),
        'moe':(context)=>Onta(),
      },
    ),
  );
}