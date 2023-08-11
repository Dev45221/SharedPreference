import 'package:flutter/material.dart';
import 'package:shared_preference/SplashPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var name = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.deepPurple.shade200,
      ),
      body: Center(
          child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              color: Colors.deepPurple.shade50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: "Welcome,\n", style: TextStyle( fontSize: 20, color: Colors.deepPurple.shade200 )),
                            TextSpan(text: name , style: const TextStyle( fontSize: 30, color: Colors.deepPurple, fontWeight: FontWeight.bold, letterSpacing: 3, fontStyle: FontStyle.italic )),
                          ]
                        )
                    ),
                    Icon(Icons.home,color: Colors.deepPurple.withOpacity(0.5), size: 180,),
                    const SizedBox(height: 30,),
                    OutlinedButton(
                        onPressed: () async {
                          var sharedPref = await SharedPreferences.getInstance();
                          sharedPref.setBool(SplashPageState.LOGGED_IN_KEY, false);

                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage() ));

                        }, child: const Text("Logout", style: TextStyle( fontSize: 16, color: Colors.deepPurple ),))
              ]
              )
          )),
    );
  }

  void getData() async {
    var pref = await SharedPreferences.getInstance();

    setState(() {
      name = pref.getString("name")!;
    });
  }
}
