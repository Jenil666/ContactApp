import 'dart:io';

import 'package:flutter/material.dart';
import 'package:contact_diary/variables.dart';


class Onta extends StatefulWidget {
  const Onta({Key? key}) : super(key: key);

  @override
  State<Onta> createState() => _OntaState();
}

class _OntaState extends State<Onta> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: Column(
        children: [
          Path != ""?
          Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 100,
              backgroundImage: FileImage(File("$Pathe")),
            ),
          ):
          Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("assets/images/addphoto.jpg"),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
