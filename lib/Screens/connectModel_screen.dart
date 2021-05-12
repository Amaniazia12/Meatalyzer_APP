
import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class Connect_Screen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Connect_Screen> {
  bool _isloading;
  File _image ;
  List _output;
  @override
  void initState() {
    super.initState();
    _isloading=true;
    loadModel().then((val){
      setState() {
      _isloading=false;
    };
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("run Model"),
      ),
      body: _isloading ? Container(
        child:CircularProgressIndicator(),
      ) :Container(
        child:Column(
          children: <Widget>[
            _image ==null ?Container(): 
            Image.file(_image),
            SizedBox(height: 16,),
            _output==null? Text("no data") : 
            Text("${_output[0]["label"]}")
          ],
        )
      ) ,
      floatingActionButton:FloatingActionButton(
       onPressed: (){
        chooseImage();
       },
       child: Icon(
         Icons.image
         ) ,
      ) ,
    );
}
chooseImage() async {
  var img = await ImagePicker.pickImage(source: ImageSource.gallery);
  if (img ==null) return null;
  setState(() {
    _isloading=true;
    _image=img;
  });
  runModelOnImage(img);
}
runModelOnImage (File image) async{
  var outPut = await Tflite.runModelOnImage(
    
    path: image.path,
    numResults: 2,
    imageMean: 127.5,
    imageStd: 127.5,
    threshold: 0.5,
  );
  
  setState(() {
    print("kkkkkkkkkkkkkkkkkkkkkkkkk"+outPut[0].toString());
    //print("kkkkkkkkkkkkkkkkkkkkkkkkk"+outPut[1].toString());

    _isloading=false;
    _output= outPut;
  });
}
}

loadModel()async{
  await Tflite.loadModel(
    model: "assets/models/typesModel.tflite" ,
    labels: "assets/models/labelsOfModelTypes.txt"
    );
}