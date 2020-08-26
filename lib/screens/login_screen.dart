import 'package:ctz_wtch/screens/home_feed.dart';
import 'package:ctz_wtch/screens/register_screen.dart';
import 'package:ctz_wtch/services/databaseService.dart';
import 'package:ctz_wtch/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ctz_wtch/constants.dart';

class LogInScreen extends StatefulWidget {
  static const String id = 'LogInScreen';
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final firebaseInit = Firebase.initializeApp();
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool mySpiner = false;

  @override
  Widget build(BuildContext context) {
    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;
    double defaultIconSize = 17;
    bool _showPassword = true;

    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: mySpiner,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
            width: double.infinity,
            color: Colors.white70,
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 230,
                        height: 60,
                        alignment: Alignment.center,
                        child: Text(
                          'Citizen Watch',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff007dfe), //primary
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        showCursor: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Color(0xFF666666),
                            size: defaultIconSize,
                          ),
                          fillColor: Color(0xFFF2F3F5),
                          hintStyle: TextStyle(
                              color: Color(0xFF666666),
                              fontFamily: defaultFontFamily,
                              fontSize: defaultFontSize),
                          hintText: "Email Address",
                        ),
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        obscureText: _showPassword,
                        showCursor: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xFF666666),
                            size: defaultIconSize,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _showPassword = true;
                            },
                            child: _showPassword
                                ? Icon(
                                    Icons.remove_red_eye,
                                    color: Color(0xFF666666),
                                    size: defaultIconSize,
                                  )
                                : Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.red,
                                  ),
                          ),
                          fillColor: Color(0xFFF2F3F5),
                          hintStyle: TextStyle(
                            color: Color(0xFF666666),
                            fontFamily: defaultFontFamily,
                            fontSize: defaultFontSize,
                          ),
                          hintText: "Password",
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // Container(
                      //   width: double.infinity,
                      //   child: Text(
                      //     "Forgot your password?",
                      //     style: TextStyle(
                      //       color: Color(0xFF666666),
                      //       fontFamily: defaultFontFamily,
                      //       fontSize: defaultFontSize,
                      //       fontStyle: FontStyle.normal,
                      //     ),
                      //     textAlign: TextAlign.end,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      AuthButton(
                        name: 'LOGIN',
                        onTap: () async {
                          setState(() {
                            mySpiner = true;
                          });
                          final loggedInUser =
                              await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                          if (loggedInUser != null) {
                            Navigator.of(context).pushNamed(HomeFeed.id);
                          }
                          setState(() {
                            mySpiner = false;
                          });
                        },
                      ),
                      SizedBox(
                        height: 2,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.pushReplacementNamed(
                            context, RegisterScreen.id),
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontFamily: defaultFontFamily,
                                fontSize: defaultFontSize,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Color(0xFFf7418c),
                                fontFamily: defaultFontFamily,
                                fontSize: defaultFontSize,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
