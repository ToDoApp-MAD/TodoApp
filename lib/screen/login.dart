// ignore_for_file: prefer_const_constructors_in_immutables, prefer_final_fields, prefer_const_constructors, non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:todo_app/const/colors.dart';
import 'package:todo_app/data/auth_data.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback show;
  LoginScreen(this.show, {super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode1.addListener(() {
      setState(() {});
    });
    super.initState();
    _focusNode2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            image(),
            SizedBox(height: 50),
            textfield(email, _focusNode1, 'Email', Icons.email),
            SizedBox(height: 10),
            textfield(password, _focusNode2, 'Password', Icons.key),
            SizedBox(height: 8),
            create_accout(),
            SizedBox(height: 20),
            login_button(),
          ],
        ),
      )),
    );
  }

  Widget create_accout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
          SizedBox(width: 5),
          GestureDetector(
            onTap: widget.show,
            child: Text(
              'Sign Up',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget login_button() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          AuthenticationRemote().login(email.text, password.text);
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: custom_green,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'LogIn',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget textfield(TextEditingController _controller, FocusNode _focusNode, String typeName, IconData icons) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: Icon(
              icons,
              color: _focusNode.hasFocus ? custom_green : Color(0xffc5c5c5),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: typeName,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xffc5c5c5),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: custom_green,
                width: 2.0,
              ),
            )
          ),
        ),
      ),
    );
  }

  Widget image() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/7.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
