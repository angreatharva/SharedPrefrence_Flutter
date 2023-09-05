import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefrence/LoginPage.dart';

import 'HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home : MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  static const String KEYLOGIN="Login";

  @override
  void initState() {

    WhereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Shared Preference")),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.blue,
          child: Icon(Icons.account_circle,size: 200,color: Colors.white,),
        ),
      )
    );
  }

  Future<void> WhereToGo() async {

    var Sharedperfs=await SharedPreferences.getInstance();
    var isLoggedIn=Sharedperfs.getBool(KEYLOGIN);


    Timer(Duration(milliseconds: 1500),(){
      if(isLoggedIn!=null){
        if(isLoggedIn){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
        }
        else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
        }
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));

      }
    });
  }


}
