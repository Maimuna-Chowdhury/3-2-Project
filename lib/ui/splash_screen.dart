import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:investment_farmer/const/AppColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investment_farmer/ui/registrationScreen.dart';

import 'bottom_nav_pages/home.dart';
import 'loginScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initstate(){
    Timer(Duration(seconds: 3),()=>Navigator.push(context,CupertinoPageRoute(builder: (__)=>Home())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light_green,
      body:SafeArea(
          child:Center(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("IFarmers",style:TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 44.sp) ,),
                  SizedBox(height: 20.h,),
                  CircularProgressIndicator(color:Colors.white),
                ],
              ),
          ),
         ),

    );
  }
}
