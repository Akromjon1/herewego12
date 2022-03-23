import 'package:flutter/material.dart';
import 'package:herewego/pages/signin_page.dart';
import 'package:herewego/services/auth_services.dart';
class HomePage extends StatefulWidget {
  static final String id = "home_page";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text("Home"),
      ),
      body: Center(
        child: FlatButton(
          color: Colors.deepOrange,
          onPressed: () {
            AuthService.SignOutUser(context);
          },
          child: Text("Log out",style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}