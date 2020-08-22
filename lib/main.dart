import 'package:ctz_wtch/routes/routes.dart';
import 'package:ctz_wtch/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Citizen Watch',
            theme: ThemeData(
              accentColor: Color(0xff007dfe),
              primaryColor: Color(0xff007dfe),
              splashColor: Color(0xff007dfe),
              backgroundColor: Color(0xffEDEDED),
              scaffoldBackgroundColor: Color(0xffEDEDED),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            routes: myRoutes,
            initialRoute: LogInScreen.id,
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
