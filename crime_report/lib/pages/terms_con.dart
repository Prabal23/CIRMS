import 'package:crime_report/main.dart';
import 'package:crime_report/pages/login_reg.dart';
import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:crime_report/pages/terms_con.dart';
import 'package:crime_report/pages/profile.dart';
import 'package:crime_report/pages/notify_page.dart';
import 'package:crime_report/pages/progress.dart';
import 'package:crime_report/pages/main_page.dart';
import 'package:crime_report/pages/rep_cat.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TnCPage extends StatefulWidget {
  @override
  _TnCPageState createState() => new _TnCPageState();
}

class _TnCPageState extends State<TnCPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Drawer drawer = new Drawer(
      child: Container(
        color: Colors.black,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ],
              ),
              //trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              },
              //trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text(
                "Start Reporting",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RepCatPage()),
                );
              },
              //trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              //trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      "Report Progress",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    Container(
                      transform: Matrix4.translationValues(-15.0, -10.0, 0.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 10,
                      ),
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProgressPage()),
                );
              },
              //trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text(
                "Notifications",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotifyPage()),
                );
              },
              //trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text(
                "",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              //trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: GestureDetector(
                onTap: () {
                  logoutAlert("Do you want to logout?");
                },
                child: Text(
                  "Log Out",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              //trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TnCPage()),
                  );
                },
                child: Text(
                  "Legal v1.01",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              //trailing: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
    return Scaffold(
      drawer: drawer,
      appBar: AppBar(backgroundColor: mainheader, title: Text("Crime Report")),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20, right: 20),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Legal",
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Terms & Conditions & Privacy Policy",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Terms and Conditions agreements act as a legal contract between you (the company) who has the website or mobile app and the user who access your website and mobile app. Having a Terms and Conditions agreement is completely optional. No laws require you to have one. Not even the super-strict and wide-reaching General Data Protection Regulation (GDPR). It’s up to you to set the rules and guidelines that the user must agree to. You can think of your Terms and Conditions agreement as the legal agreement where you maintain your rights to exclude users from your app in the event that they abuse your app, where you maintain your legal rights against potential app abusers, and so on. \nTerms and Conditions are also known as Terms of Service or Terms of Use.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Terms and Conditions agreements act as a legal contract between you (the company) who has the website or mobile app and the user who access your website and mobile app. Having a Terms and Conditions agreement is completely optional. No laws require you to have one. Not even the super-strict and wide-reaching General Data Protection Regulation (GDPR). It’s up to you to set the rules and guidelines that the user must agree to. You can think of your Terms and Conditions agreement as the legal agreement where you maintain your rights to exclude users from your app in the event that they abuse your app, where you maintain your legal rights against potential app abusers, and so on. \nTerms and Conditions are also known as Terms of Service or Terms of Use.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(15),
          color: blackbutton,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BackButton(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void logoutAlert(String msg) {
    showDialog<String>(
      context: context,
      barrierDismissible:
          false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context).copyWith(dialogBackgroundColor: Colors.white),
          child: AlertDialog(
            title: new Text(
              "Logout",
              style: TextStyle(color: Colors.black),
            ),
            content: new Text(
              msg,
              style: TextStyle(color: Colors.black),
            ),
            actions: <Widget>[
              Row(
                children: <Widget>[
                  new FlatButton(
                    child: new Text(
                      "Yes",
                      style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                    onPressed: () {
                      logoutConfirm();
                    },
                  ),
                  new FlatButton(
                    child: new Text(
                      "No",
                      style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  void logoutConfirm() async {
    Navigator.of(context).pop();
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('user');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LogRegPage()),
    );
  }
}
