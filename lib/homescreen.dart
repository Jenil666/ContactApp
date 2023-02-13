import 'dart:io';

import 'package:contact_diary/variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          backgroundColor: Colors.greenAccent.shade700,
          onPressed: () {},
          child: Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            child: Icon(Icons.dialpad_outlined, color: Colors.white),
            decoration: BoxDecoration(
              color: Colors.greenAccent.shade700,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                "Contacts",
                style: GoogleFonts.dosis(fontSize: 50),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Row(
            children: [
              Expanded(child: SizedBox()),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'add').then((value) {
                    setState(() {});
                  });
                },
                icon: Icon(
                  Icons.person_add_alt_1,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              SizedBox(      width: 30,
              ),
            ],
          ),
          SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: (){
                      Pathe = Imagespath[index];
                      Navigator.pushNamed(context, 'moe',arguments: index).then((value) {
                        setState(() {
                        });
                      });
                    },
                    child: Con(name[index], Imagespath[index]));
              },
              //shrinkWrap: true,
              itemCount: name.length,
            ),
          ),
        ],
      ),
    ));
  }

  Widget Con(String na, String img) {
    return Container(
      margin: EdgeInsets.all(10),
      //color: Colors.red,

      height: 55,
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(
            width: 0,
          ),
          if (img != "")
            Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: FileImage(File("$img")),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
            )
          else
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(
                "assets/images/addphoto.jpg",
              ),
            ),
          SizedBox(
            width: 25,
          ),
          Text(
            "$na",
            style: GoogleFonts.varelaRound(fontSize: 20, color: Colors.black),
          )
        ],
      ),
    );
  }
}
