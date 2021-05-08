
import 'package:Meatalyzer_app/Screens/Camera_Screen.dart';
import 'package:Meatalyzer_app/Screens/Information_screen.dart';

import 'package:flutter/material.dart';
import '../Models/data.dart';
import '../Widgets/Slider_Widget.dart';
import './Information_screen.dart';
class Slider_screen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Slider_screen> {
  List<SliderModel> slides = new  List<SliderModel>();
  int CurrentIndex = 0;
  @override
  void initState() {
    super.initState();
    slides = getSliders();
  }

  void _nextScreen (BuildContext cont){
    Navigator.of(cont).pushNamed(
      Camera_screen.routName,
      );
      }
  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      //color: Colors.orange,
      margin: EdgeInsets.symmetric(horizontal: 7.0),
      height: isCurrentPage ? 10.0 :6.0,
      width: isCurrentPage ? 10.0 :6.0 ,
      decoration: BoxDecoration(
        color: isCurrentPage ? Color(0xFFBE0908):Colors.grey[300],
        borderRadius: BorderRadius.circular(12)
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:
       PageView.builder(
            itemCount:slides.length,
            onPageChanged: (val){
              setState(() {
                CurrentIndex = val;
              });
            },
            itemBuilder:(context,index){
               return SliderTitle(
                 imageAssetPath:slides[index].getImageAssertPath(),
                 title:slides[index].getTitle(),
                 desc:slides[index].getDosc(),
               );
            }
            ),
       bottomSheet:CurrentIndex!= slides.length-1 ?
        Container(
          color:Colors.white,
          padding: EdgeInsets.only(bottom: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
              SizedBox( width:MediaQuery.of(context).size.width*0.2 ),
              for(int i=0;i<slides.length;i++)
                   CurrentIndex == i ?pageIndexIndicator(true) : pageIndexIndicator(false)  ,
              SizedBox( width:MediaQuery.of(context).size.width*0.2 ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                   Container(
                       child: GestureDetector(  
                          onTap:()=>_nextScreen (context),
                          child:Container(
                              padding: EdgeInsets.all(17),
                              decoration: BoxDecoration(
                                //color: Colors.white,
                                borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100.0),
                                topLeft: Radius.circular(100.0),
                                bottomRight: Radius.circular(100.0),
                                topRight: Radius.circular(100.0)),),
                                child: Text("Skip >" , style: TextStyle(color:Colors.black87),),
                           )
                      ),
                    ),
                  ],
                )
             ],
          ),
        ):
      Container( 
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 65,
        color:  Color(0xFFBE0908),
        child:FlatButton(
            child:Text("GET START NOW",style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600) ),
            onPressed:()=>_nextScreen (context),
            ),    
      ),
    );
  }
}

