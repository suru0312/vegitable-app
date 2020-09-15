import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vegi_login/home.dart';
import 'package:vegi_login/main.dart';

class registration extends StatefulWidget {
  static String Tag = "registrartion";

  @override
  _registrationState createState() => _registrationState();
}

class _registrationState extends State<registration> {
  bool b = true;
  String phone = "";
  String email = "";

  Widget getformfield(TextEditingController controller, String hinttext,
      {bool obsecure = false,
      String prefixtext,
      Icon prefixicon,
      TextInputType inputType = TextInputType.text,
      IconButton suffixicon}) {
    return TextFormField(
      obscureText: obsecure,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        hintText: hinttext,
        labelText: hinttext,
        prefixIcon: prefixicon,
        suffixIcon: suffixicon,
      ),
      validator: (value) {
        return value.isEmpty ? "$hinttext can not be blanck" : null;
      },
    );
  }

  String password = "";
  String firstn = "";
  String lastn = "";
  String phn = "";
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController fn = TextEditingController();
  TextEditingController ln = TextEditingController();
  TextEditingController em = TextEditingController();
  TextEditingController ph = TextEditingController();
  TextEditingController ps = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "REGISTER",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Form(
                key: formstate,
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(10)),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: getformfield(fn, "Firstname",
                              prefixicon: Icon(Icons.person)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                        ),
                        Flexible(
                          child: getformfield(ln, "Lastname"),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 12)),
                    getformfield(em, "Email", prefixicon: Icon(Icons.email)),
                    Padding(padding: EdgeInsets.only(top: 12)),
                    getformfield(ph, "Mobile No",
                        prefixicon: Icon(Icons.phone),
                        prefixtext: "+91 ",
                        inputType: TextInputType.phone),
                    Padding(padding: EdgeInsets.only(top: 12)),
                    getformfield(ps, "Password",
                        obsecure: b,
                        prefixicon: Icon(Icons.lock),
                        suffixicon: IconButton(
                            icon: (b ==true)
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                b = !b;
                              });
                            })),
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
                              "REGISTER",
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
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Already have an account ?",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          FlatButton(
                              onPressed: () {
                                Navigator.pushNamed(context, login.Tag);
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
