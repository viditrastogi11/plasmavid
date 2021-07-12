import 'package:flutter/material.dart';
import 'package:plasmavid/screens/DonateMedicineForm.dart';
import 'package:plasmavid/screens/DonatePlasmaForm.dart';
import 'package:plasmavid/screens/TabScreen.dart';
import 'package:plasmavid/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.orange,
          primaryColor: Colors.orange,
          accentColor: Colors.orange[200]),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return TabScreen();
            }
            return Home();
          }),
      routes: {
        DonatePlasmaForm.routeName: (ctx) => DonatePlasmaForm(),
        Home.routeName: (ctx) => Home(),
        DonateMedicineForm.routeName: (ctx) => DonateMedicineForm(),
      },
    );
  }
}
