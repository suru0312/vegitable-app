import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vegi_login/home.dart';
import 'package:vegi_login/registration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  var route = {
    login.Tag: (context) => login(),
    registration.Tag: (context) => registration(),
    home.Tag: (context) => home(),
  };

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green[400]),
      debugShowCheckedModeBanner: false,
      routes: route,
    );
  }
}

class login extends StatefulWidget {
  static String Tag = "/";

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  bool b = true;
  bool onoff = true;
  String eml = "";
  String pass = "";
  TextEditingController em = TextEditingController();
  TextEditingController ps = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vegetable-Store",style: TextStyle(fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 23),),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(children: <Widget>[
                Padding(padding: EdgeInsets.all(20)),
                TextField(
                  controller: em,
                  decoration: InputDecoration(
                    labelText: "Email-Id",
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                TextField(
                  controller: ps,
                  obscureText: b,
                  decoration: InputDecoration(
                      labelText: "password",
                      prefixIcon: Icon(Icons.phonelink_lock),
                      suffixIcon: IconButton(
                          icon: (b == false)
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              b = !b;
                            });
                          })),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        onPressed: () {
                          setState(() {
                            Navigator.pushNamed(context, home.Tag);
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.green[400],
                        hoverColor: Colors.grey,
                        splashColor: Colors.green,
                        elevation: 10.0,
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(10)),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Don`t have an account yet ?",style: TextStyle(fontWeight: FontWeight.bold),),
                        //Padding(padding: EdgeInsets.only(left: 1)),
                        FlatButton(
                            child: Text(
                              "Register Now",
                              style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, registration.Tag);
                            }),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
