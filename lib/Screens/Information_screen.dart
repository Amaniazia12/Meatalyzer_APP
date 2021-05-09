import 'package:flutter/material.dart';


class Information_screen extends StatefulWidget {
  @override
  _Information_screenState createState() => _Information_screenState();
  static String routName= 'Information_screen';
}

class _Information_screenState extends State<Information_screen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red[900],
        leading: IconButton(icon:Icon( Icons.arrow_back_ios,color: Colors.black,), onPressed:(){ Navigator.of(context).pop();}),
      ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
          //mainAxisAlignment: MainAxisAlignment.,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          Container(
           height: 250,
           width: 325,
           decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200.0),bottomRight: Radius.circular(200.0),), color: Colors.red[900],),
            child : CircleAvatar(
              radius: 10,
              backgroundImage: AssetImage("assets/OIP.jpg",),
            ),
            //child: Container(padding: EdgeInsets.only(top: 10), width: 25, height: 25, child : Image.asset("assets/OIP.jpg",width: 10,),),
          ),
            Image(image: AssetImage('assets/images/cow1.png'),),
            Text ('  Type :   Beef ',style: TextStyle(fontSize: 23,color: Colors.black,height: 3.0),),
            Text ('  Part :   Resha ',style: TextStyle(fontSize: 23,color: Colors.black,height: 2.0),),
            Text ('  Day  :   1 - 2 ',style: TextStyle(fontSize: 23,color: Colors.black,height: 2.0),),
            Text ('  Description :',style: TextStyle(fontSize: 23,height: 4.0)),
            Text ('   this meat is fresh and Edible to eat ',style: TextStyle(fontSize: 15),)
          ],
    ),
        ),
    );
  }
}