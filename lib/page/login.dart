import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tripbooking/page/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Attribute or Property
  // Global variable
  String myText1 = '';

  @override
  Widget build(BuildContext context) {
    // Local variable
    String myText2 = '';

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Image.asset(
                  'assets/images/logo.jpg',
                  width: 250,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 50.0),
              child: Text('หมายเลขโทรศัพท์'),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 50.0, right: 50),
              child: TextField(),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0, left: 50),
              child: Text('รหัสผ่าน'),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 50.0, right: 50),
              child: TextField(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ));
                      },
                      child: const Text('ลงทะเบียนใหม่')),
                  FilledButton(
                      onPressed: () {
                        setState(() {
                          myText1 = 'login';
                          log(myText1);
                        });
                      },
                      child: const Text('เข้าสู่ระบบ'))
                ],
              ),
            ),
            Center(

                /// if (myText1 == 'login'){
                ///   Text('เข้าสู่ระบบ');
                /// } else{
                ///   Text('ลงทะเบียน');
                /// }
                child: (myText1 == 'login')
                    ? Text('เข้าสู่ระบบ')
                    : Text('ลงทะเบียน'))
          ],
        ),
      ),
    );
    ;
  }
}