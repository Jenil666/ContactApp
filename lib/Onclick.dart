import 'dart:io';

import 'package:contact_diary/variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


class Onta extends StatefulWidget {
  const Onta({Key? key}) : super(key: key);

  @override
  State<Onta> createState() => _OntaState();
}

class _OntaState extends State<Onta> {
  @override
  Widget build(BuildContext context) {
    print(Pathe);
    int ind = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {
              showDialog(context: context, builder: (context) => AlertDialog(
                content: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: newtxtname,
                        decoration: InputDecoration(
                          hintText: "${name[ind]}"
                        ),
                      ),
                      TextField(
                        keyboardType: TextInputType.phone,
                        controller: newtxtnumber,
                        decoration: InputDecoration(
                          hintText: "${number[ind]}"
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(onPressed: () {
                    setState(() {
                      number[ind] = newtxtnumber.text;
                      name[ind] = newtxtname.text;
                    });
                    newtxtname.clear();
                    newtxtnumber.clear();
                    Navigator.pop(context);
                  }, child: Text("Done")),
                  ElevatedButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: Text("Cancle"))
                ],
              ),
              );
            }, icon: Icon(Icons.edit,color: Colors.black,))
          ],
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back,color: Colors.black,),),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      body: Column(
        children: [
          Pathe != ""?
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
          SizedBox(height: 30,),
          InkWell(
            onTap: () async{
              print("================= ${number[ind]} ================");
              await launchUrl(Uri.parse("tel: ${number[ind]}"));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(Icons.call,color: Colors.black,),
                  SizedBox(width: 10,),
                  Text("|",style: TextStyle(color: Colors.black,fontSize: 30),),
                  SizedBox(width: 8,),
                  Text("${number[ind]}",style: GoogleFonts.lato(fontSize: 18),),
                  Spacer(),
                  Text("${name[ind]}"),
                  SizedBox(width: 10,),
                ],
              ),
            ),
          ),
          SizedBox(height: 5,),
          InkWell(
            onTap: ()async{
              await launchUrl(Uri.parse("sms: ${number[ind]}"));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(Icons.message,color: Colors.black,),
                  SizedBox(width: 10,),
                  Text("|",style: TextStyle(color: Colors.black,fontSize: 30),),
                  SizedBox(width: 8,),
                  Text("${number[ind]}",style: GoogleFonts.lato(fontSize: 18),),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
