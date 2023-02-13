import 'dart:io';

import 'package:contact_diary/variables.dart';
import 'package:contact_diary/variables.dart';
import 'package:contact_diary/variables.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'variables.dart';
import 'variables.dart';

class Addcontact extends StatefulWidget {
  const Addcontact({Key? key}) : super(key: key);

  @override
  State<Addcontact> createState() => _AddcontactState();
}

class _AddcontactState extends State<Addcontact> {


  var FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: FormKey,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            actions: [
             IconButton(onPressed: () {
              if(FormKey.currentState!.validate())
                {
                  setState(() {
                    print(name);
                    name.add(txtname.text);
                    number.add(txtnumber.text);
                    Imagespath.add(Path);
                  });
                  txtnumber.clear();
                  txtname.clear();
                  Path = "";

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data Received 😊"),duration: Duration(seconds: 1),));
                  Navigator.pop(context);

                }
              else
                {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter The data !!!!!")));
                }
             }, icon:  Icon(Icons.done,color: Colors.black,),),
              SizedBox(width: 10,),
            ],
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text("Add Contact", style: TextStyle(color: Colors.black)),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                Stack(
                  children: [
                    Path != ""?
                    Container(
                      height: 220,
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: FileImage(File("$Path")),
                      ),
                    ):
                    Container(
                      height: 220,
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage("assets/images/addphoto.jpg"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 250,top: 150),
                      child: Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        child: IconButton(onPressed: () async {
                          final ImagePicker photo = ImagePicker();
                          final XFile? image = await photo.pickImage(source: ImageSource.gallery);
                          setState(() {
                            Path = image!.path;
                          });

                        }, icon: Icon(Icons.add,color: Colors.black54,)),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (value) {
                      if(value!.isEmpty)
                        {
                          return "Enter Name";
                        }
                      return null;
                    },
                    controller: txtname,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: "Enter Name",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      disabledBorder: UnderlineInputBorder(
                         borderSide: BorderSide(color: Colors.black45),
                      )
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (value) {
                      if(value!.isEmpty)
                        {
                          return "Enter Number";
                        }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    controller: txtnumber,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: "Enter Number",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      disabledBorder: UnderlineInputBorder(
                         borderSide: BorderSide(color: Colors.black45),
                      )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
