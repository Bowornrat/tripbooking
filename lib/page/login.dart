import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tripbooking/config.dart';
import 'package:tripbooking/page/register.dart';
import 'package:tripbooking/page/showTrip.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Attribute or Property
  // Global variable
  String myText1 = '';
  String phone = '';
  var passwordCtl = TextEditingController();
  // TextEditingController passwordCtl = TextEditingController();

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
            Padding(
              padding: EdgeInsets.only(left: 50.0, right: 50),
              child: TextField(
                onChanged: (value) {
                  // log(value);
                  phone = value;
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0, left: 50),
              child: Text('รหัสผ่าน'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50),
              child: TextField(
                obscureText: true,
                controller: passwordCtl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ));
                      },
                      child: const Text('ลงทะเบียนใหม่')),
                  FilledButton(
                      onPressed: () async {
                        log(apiEndpoint);
                        //apiEndpoint = https://jupiter.csc.ku.ac.th/~fsebrs/api.php/records
                        // 1. Generate url
                        String url =
                            '$apiEndpoint/customer?filter=phone,eq,$phone&filter=password,eq,${passwordCtl.text}';
                        // 2. Call Api using http (Async)
                        var response = await http.get(Uri.parse(url));
                        log(response.body);

                        // 3. Convert received data to "Model"

                        // 4. Check login to system
                        // If found data in database
                        // Open ShowTrip
                        // Else log('Phone or Password incorrect');

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const ShowTripPage(),
                        //     ));
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

  // Method for delay 3 sec and print BBB
  Future<void> testAsync() async {
    return Future.delayed(const Duration(seconds: 3), () => log('BBB'));
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
