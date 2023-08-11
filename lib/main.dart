import 'package:flutter/material.dart';
import 'package:shared_preference/SplashPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nameController = TextEditingController();
  var passController = TextEditingController();

  var nameData = "", passData = "";

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getValue();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Shared Preference"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.account_circle, size: 180, color: Colors.deepPurple,),
                const SizedBox(height: 20,),
                SizedBox(
                  width: 300,
                  child: TextField(
                      keyboardType: TextInputType.text,
                      controller: nameController,
                      decoration: InputDecoration(
                          labelText: "Username",
                          alignLabelWithHint: true,
                          prefixIcon: const Icon(
                            Icons.account_circle,
                            color: Colors.deepPurple,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.deepPurple)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              )))),
                ),
                const SizedBox(height: 15,),
                SizedBox(
                  width: 300,
                  child: TextField(
                      keyboardType: TextInputType.text,
                      controller: passController,
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          labelText: "Password",
                          alignLabelWithHint: true,
                          prefixIcon: const Icon(
                            Icons.key,
                            color: Colors.deepPurple,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.deepPurple)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              )))),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: () async {
                      var name = nameController.text.toString();
                      // var pass = passController.text.toString();
                      //
                      // var namePreference = await SharedPreferences.getInstance();
                      // var passPreference = await SharedPreferences.getInstance();
                      //
                      // namePreference.setString("name", name);
                      // passPreference.setString("pass", pass);
                      var sharedPref = await SharedPreferences.getInstance();
                      var username = sharedPref.setString("name", name);

                      sharedPref.setBool(SplashPageState.LOGGED_IN_KEY, true);

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage() ));

                    }, child: const Text("Login", style: TextStyle( fontSize: 18 ),)
                ),
                const SizedBox(height: 20,),
                // Text("$nameData\n$passData", style: const TextStyle( fontSize: 16, color: Colors.deepPurple ),),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void getValue() async {
  //   var pref = await SharedPreferences.getInstance();
  //   var name = pref.getString("name");
  //   var pass = pref.getString("pass");
  //
  //   setState(() {
  //     nameData = name ?? "";
  //     passData = pass ?? "";
  //   });
  //
  // }
}
