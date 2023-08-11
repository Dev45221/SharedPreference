import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preference/HomePage.dart';
import 'package:shared_preference/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {

  static const LOGGED_IN_KEY = "login";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectPage();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black,
            child: const Center(child: Text("Shared Preference Demo", style: TextStyle( fontSize: 25, color: Colors.white ),))
        ),
      ),
    );
  }

  void selectPage() async {
    var sharedData = await SharedPreferences.getInstance();
    var isLoggedIn = sharedData.getBool(LOGGED_IN_KEY);

    Timer(const Duration(seconds: 3), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage() ));
        } else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage() ));
        }
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage() ));
      }
    });

  }
}