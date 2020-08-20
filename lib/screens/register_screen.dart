import 'package:ctz_wtch/screens/home_feed.dart';
import 'package:ctz_wtch/screens/login_screen.dart';
import 'package:ctz_wtch/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'RegisterScreen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;

  String email;
  String password;
  bool mySpiner = false;

  DateTime selectedDate = DateTime.now();
  bool isPicked = false;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1990, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        isPicked = true;
      }); //get
  }

  @override
  Widget build(BuildContext context) {
    String dateOfBirth = '${selectedDate.toLocal()}'.split(' ')[0];

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
                          'Citizen Watch ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff007dfe), //primary
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: TextField(
                              textInputAction: TextInputAction.next,
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
                                fillColor: Color(0xFFF2F3F5),
                                hintStyle: TextStyle(
                                  color: Color(0xFF666666),
                                  fontFamily: defaultFontFamily,
                                  fontSize: defaultFontSize,
                                ),
                                hintText: "First Name",
                              ),
                              onChanged: (value) {
                                // firstName = value;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 1,
                            child: TextField(
                              textInputAction: TextInputAction.next,
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
                                fillColor: Color(0xFFF2F3F5),
                                hintStyle: TextStyle(
                                  color: Color(0xFF666666),
                                  fontFamily: defaultFontFamily,
                                  fontSize: defaultFontSize,
                                ),
                                hintText: "Last Name",
                              ),
                              onChanged: (value) {
                                // lastName = value;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
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

                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                            left: 15,
                            right: 10,
                            top: 18,
                            bottom: 18,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F3F5),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.date_range,
                                size: 18,
                                color: Color(0xFF666666),
                              ),
                              SizedBox(width: 15),
                              Text(
                                isPicked ? dateOfBirth : 'Date of Birth',
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontFamily: defaultFontFamily,
                                  fontSize: defaultFontSize,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),

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
                        name: 'REGISTER',
                        onTap: () async{
                          setState(() {
                            mySpiner = true;
                          });
                          final registeredUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                          if(registeredUser != null){
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
                        Navigator.pushReplacementNamed(context, LogInScreen.id),
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
