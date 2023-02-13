import 'package:flutter/material.dart';

class Onta extends StatefulWidget {
  const Onta({Key? key}) : super(key: key);

  @override
  State<Onta> createState() => _OntaState();
}

class _OntaState extends State<Onta> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: AppBar(),),);
  }
}
