
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
//import 'package:image_picker/image_picker.dart';

AppBar header ( {String  name , removeBackButton = false })
{
  return AppBar(
    // if removeBackButton return true => not found return page
    automaticallyImplyLeading: removeBackButton ? false :true ,
    centerTitle: true,
    title: Text( name ,
      style: TextStyle (color: Colors.white , fontSize: 25.0 ),),
    backgroundColor:Colors.red[900],
  );
}

Container circuleprogress()
{
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(top: 10.0),
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.red[900]),
    ),
  );

}

class Camera_screen extends StatefulWidget{
  @override
  _upload_imageState createState() => _upload_imageState();
  static String routName= 'camera_screen';
}

class _upload_imageState extends State<Camera_screen> {
  File file_image ;

  @override
  Widget build(BuildContext context) {
    return file_image == null ?Upload_image1() : confirm_image() ;
  }

  Container Upload_image1(){
     return Container (
       child: Scaffold(
        appBar: header(name: "Take an overview photo" , removeBackButton: true),
        body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               Image(image: AssetImage('image/OIP.jpg'),),
                Padding (padding: EdgeInsets.only(top: 70.0)),
                Container(
                  height: 55,
                  child: RaisedButton(
                    onPressed: (){ (context);},
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                    color: Colors.red[900],
                    child: Text("Upload chooseImageimage",style: TextStyle(color: Colors.white,fontSize: 20.0),),
                  ),
                )
              ]
          ),
        ),
    );
  }
  chooseImage(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context){
          return SimpleDialog(
            children: <Widget>[
              //SimpleDialogOption( child: Text ("Photo With Camera"), onPressed: (){ camerafun();},),
              //SimpleDialogOption( child: Text ("Photo From Gallery"), onPressed: (){ galleryfun();},),
              SimpleDialogOption( child: Text ("Cancel"),onPressed: (){Navigator.pop(context);},)
            ],
          );
        });
  }
  /*final ImagePicker _picker = ImagePicker();
  Future camerafun()async{
    Navigator.pop(context);
    final pickedFile = await _picker.getImage(source: ImageSource.camera, maxHeight: 675, maxWidth: 960);
    setState(() {
      this.file_image = pickedFile as File;
    });
  }
  Future galleryfun() async{
    Navigator.pop(context);
    final pickedFile =  await _picker.getImage(source: ImageSource.gallery ,maxHeight: 675,maxWidth: 960);
    print("*******************************************************************************************************");
    setState(() {
      this.file_image = pickedFile as File;
    });
  }
  */
  Container confirm_image() {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true ,
          leading: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {Upload_image1();},
                ),
                Text("Retake",style: TextStyle(color: Colors.white,fontSize: 20.0),),
              ],
            ),
          ),
          centerTitle: true,
          title: Text( "Overview Photp" ,
            style: TextStyle (color: Colors.white , fontSize: 25.0 ),),
          backgroundColor:Colors.red[900],
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width *0.8,
                height: 220.0,
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 16/9,
                    child: Container(
                        decoration: BoxDecoration(image: DecorationImage(image: FileImage(file_image),fit: BoxFit.cover))
                    ),
                  ),
                ),
              ),
              FlatButton(

                onPressed: (){},
                child: Text("Confirm" , style:TextStyle(color: Colors.white, fontSize: 20.0),),
                color: Colors.red[900],
              )
            ],
          ),
        ),
      ),
    );
  }
  }
