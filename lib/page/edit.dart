import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tripbooking/config.dart';
import 'package:tripbooking/model/customer_post_req.dart';
import 'package:http/http.dart' as http;
import 'package:tripbooking/page/login.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  // Global vars
  var fullnameCtl = TextEditingController();
  var phoneCtl = TextEditingController();
  var emailCtl = TextEditingController();
  var passwordCtl = TextEditingController();
  var confirmCtl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แก้ไขข้อมูลส่วนตัว'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('ชื่อ-นามสกุล'),
              TextField(
                controller: fullnameCtl,
              ),
              const Text('หมายเลขโทรศัพท์'),
              TextField(
                controller: phoneCtl,
              ),
              const Text('อีเมล'),
              TextField(
                controller: emailCtl,
              ),
              const Text('รหัสผ่าน'),
              TextField(
                obscureText: true,
                controller: passwordCtl,
              ),
              const Text('ยืนยันรหัสผ่าน'),
              TextField(
                obscureText: true,
                controller: confirmCtl,
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FilledButton(
                    onPressed: () async {
                      if (fullnameCtl.text.isEmpty ||
                          phoneCtl.text.isEmpty ||
                          emailCtl.text.isEmpty ||
                          passwordCtl.text.isEmpty ||
                          confirmCtl.text.isEmpty) {
                        log('Fields cannot be empty');
                        return;
                      }
                      if (passwordCtl.text != confirmCtl.text) {
                        log('รหัสผ่านไม่ตรงกัน');
                        return;
                      }
                      // Insert new member to database
                      // 1. Generate URL
                      // 'https://jupiter.csc.ku.ac.th/~fsebrs/api.php'
                      // '/records/customer'
                      var url = '$apiEndpoint/customer';

                      // 2. Create Data (JSON) to be submitted
                      var customer = CustomerPostRequest(
                          fullname: fullnameCtl.text,
                          phone: phoneCtl.text,
                          email: emailCtl.text,
                          image: '',
                          password: passwordCtl.text);
                      // Json String
                      String customerJson = customerPostRequestToJson(customer);

                      // 3. POST Send (Request) to api
                      var response =
                          await http.post(Uri.parse(url), body: customerJson);

                      // 4. Receive data from request
                      log(response.body);

                      // 5. Redirect to Login Page
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    },
                    child: const Text('สมัครสมาชิก')),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('มีบัญชีอยู่แล้ว ?'),
                  TextButton(
                      onPressed: () {
                        String? x; // default = null
                        late String s;
                        s = 'aaaaa';

                        // String != String?

                        log(s);
                      },
                      child: const Text('เข้าสู่ระบบ'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
