import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefrence/HomePage.dart';

import 'main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var email=TextEditingController();
  var password=TextEditingController();

  static const String KEYNAME="EMAIL";
  var emailValue="No Value Saved";

  @override
  void initState() {
    getValue();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Shared Preference")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_circle,size: 100,color: Colors.blue,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    label: Text("Email"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11)
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                    label: Text("Password"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11)
                    )
                ),
              ),
            ),
            ElevatedButton(onPressed: () async {
              var Sharedprefs = await SharedPreferences.getInstance();
              Sharedprefs.setBool(MyHomePageState.KEYLOGIN,true);

              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

            }, child: Text("Login")),
            Text(emailValue)

          ],
        ),
      ),
    );
  }
  Future<void> getValue() async {
    var prefs = await SharedPreferences.getInstance();
    var getEmail=prefs.getString(KEYNAME);
    emailValue=getEmail ?? "No Value Saved";

    setState(() {

    });
  }
}
