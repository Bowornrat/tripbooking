import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:tripbooking/config.dart';
import 'package:tripbooking/model/customer_get_res.dart';
import 'package:tripbooking/page/register.dart';
import 'package:tripbooking/page/showTrip.dart';
import 'package:http/http.dart' as http;

import '../provider/appdata.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Attribute or Property
  // Global variable
  String myText1 = '';
  String phone = '081739999';
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
                        SmartDialog.showLoading();
                        log(apiEndpoint);
                        //apiEndpoint = https://jupiter.csc.ku.ac.th/~fsebrs/api.php/records
                        // 1. Generate url
                        String url =
                            '$apiEndpoint/customer?filter=phone,eq,$phone&filter=password,eq,${passwordCtl.text}';
                        // 2. Call Api using http (Async)
                        var response = await http.get(Uri.parse(url));
                        log(response.body);

                        // 3. Convert received data to "Model"
                        var customer =
                            customerGetResponseFromJson(response.body);
                        //log(customer.records[0].fullname);
                        // 4. Check login to system
                        // If found data in database
                        // Open ShowTrip
                        // Else log('Phone or Password incorrect');
                        if (customer.records.length == 1) {
                          // Login correct

                          // เก็บข้อมูลลง Storage
                          GetStorage gs = GetStorage();
                          gs.write('fullname', customer.records[0].fullname);
                          gs.write('phone', customer.records[0].phone);
                          gs.write('image', customer.records[0].image);

                          // เก็บข้อมูล customer ทั้งก้อนลง Provider
                          context.read<AppData>().customer = customer;

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ShowTripPage(),
                              ));
                        } else {
                          // Login incorrect
                          log('Phone or Password incorrect');
                          setState(() {
                            myText1 = 'หมายเลขโทรศัพท์หรือรหัสผ่านไม่ถูกต้อง';
                          });
                          Get.snackbar('เกิดข้อผิดพลาด',
                              'หมายเลขโทรศัพท์หรือรหัสผ่านไม่ถูกต้อง');
                        }
                        // await Future.delayed(Duration(seconds: 5));
                        SmartDialog.dismiss();
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
                child: Text(myText1)),
          ],
        ),
      ),
    );
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
