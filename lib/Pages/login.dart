import 'package:flutter/material.dart';
import 'package:popcorn/Shared/soc_icons_icons.dart';
import 'package:hexcolor/hexcolor.dart';

class Login_Page extends StatefulWidget {
  @override
  _Login_PageState createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  String email;
  String password;
  bool emailValid;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/popcorn.gif"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  'POPCORN',
                  style: TextStyle(
                      fontFamily: 'Bebas Neue',
                      fontSize: 90,
                      color: Hexcolor("#f8de8d")),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
                  child: Card(
                    shape: StadiumBorder(
                        side: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    )),
                    margin: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                    color: Colors.transparent,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      maxLines: 1,
                      minLines: 1,
                      autofocus: false,
                      enableInteractiveSelection: false,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                          focusColor: Colors.white,
                          contentPadding: EdgeInsets.only(left: 25)),
                      onChanged: (String str) {
                        setState(() {
                          email = str;
                          emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(email);
                        });
                      },
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
                  child: Card(
                    shape: StadiumBorder(
                        side: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    )),
                    margin: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                    color: Colors.transparent,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      maxLines: 1,
                      minLines: 1,
                      autofocus: false,
                      obscureText: true,
                      enableInteractiveSelection: false,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 25),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        focusColor: Colors.white,
                      ),
                      onChanged: (String str) {
                        setState(() {
                          password = str;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 13),
                alignment: Alignment.center,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 120,
                        child: FlatButton(
                          padding: EdgeInsets.all(10),
                          color: Hexcolor("#f8de8d"),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0),
                              side: BorderSide(color: Hexcolor("#f8de8d"))),
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          textColor: Colors.white,
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 120,
                        child: FlatButton(
                          padding: EdgeInsets.all(10),
                          color: Hexcolor("#f8de8d"),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0),
                              side: BorderSide(color: Hexcolor("#f8de8d"))),
                          onPressed: () {
                            Navigator.pushNamed(context, '/sign_up');
                          },
                          textColor: Colors.white,
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                        heroTag: 'google',
                        onPressed: () {},
                        child: Image.asset('images/google.png')),
                    SizedBox(
                      width: 18,
                    ),
                    FloatingActionButton(
                      heroTag: 'fb',
                      onPressed: () {},
                      backgroundColor: Hexcolor("#4267B2"),
                      child: Icon(
                        SocIcons.facebook,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.center,
                child: FlatButton(
                  color: Colors.transparent,
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: Hexcolor("#261d02"),
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: FlatButton(
                  color: Colors.transparent,
                  onPressed: null,
                  child: Text(
                    'Continue Without Signing in >>',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: Hexcolor("#261d02"),
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(bottom: 40),
              )
            ],
          ),
        ),
      ),
    );
  }
}
