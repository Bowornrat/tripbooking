import 'dart:developer';

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
        title: const Text('ลงทะเบียนสมาชิก'),
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
                    onPressed: () {
                      log('Fullname ${fullnameCtl.text}');
                      log(phoneCtl.text);
                      log(emailCtl.text);
                      log(passwordCtl.text);
                      log(confirmCtl.text);
                      if (fullnameCtl.text.isEmpty ||
                          phoneCtl.text.isEmpty ||
                          emailCtl.text.isEmpty ||
                          passwordCtl.text.isEmpty ||
                          confirmCtl.text.isEmpty) {
                        log('Fields cannot be empty');
                      }
                      if (passwordCtl.text != confirmCtl.text) {
                        log('รหัสผ่านไม่ตรงกัน');
                      }
                    },
                    child: const Text('สมัครสมาชิก')),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('มีบัญชีอยู่แล้ว ?'),
                  TextButton(onPressed: () {}, child: const Text('เข้าสู่ระบบ'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
