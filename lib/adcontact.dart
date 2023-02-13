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
            leading: IconButton(onPressed: () {
              Navigator.pop(context);
              Pathe = "";
              txtnumber.clear();
              txtname.clear();
            }, icon: Icon(Icons.cancel,color: Colors.black,),),
            actions: [
             IconButton(onPressed: () {
              if(FormKey.currentState!.validate())
                {
                  setState(() {
                    print(name);
                    name.add(txtname.text);
                    number.add(txtnumber.text);
                    Imagespath.add(Pathe);
                  });
                  txtnumber.clear();
                  txtname.clear();
                  Pathe = "";

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
                Pathe != ""?
                Container(
                  height: 220,
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: FileImage(File("$Pathe")),
                  ),
                ) :
                  Container(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage("assets/images/addphoto.jpg"),
                  ),
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
                ExpansionTile(

                  title: Text("Add photo"),
                  childrenPadding: EdgeInsets.symmetric(horizontal: 10),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              final ImagePicker photo = ImagePicker();
                              final XFile? image = await photo.pickImage(source: ImageSource.camera);
                              setState(() {
                                Pathe = image!.path;
                              });
                            },
                            child: Container(
                               height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              alignment: Alignment.center,
                              child: Icon(Icons.camera_alt_outlined,color: Colors.white,),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              final ImagePicker photo = ImagePicker();
                              final XFile? image = await photo.pickImage(source: ImageSource.gallery);
                              setState(() {
                                Pathe = image!.path;
                              });
                            },
                            child: Container(
                             height: 50,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(50)
                              ),
                              alignment: Alignment.center,
                              child: Icon(Icons.photo_album_outlined,color: Colors.white,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
