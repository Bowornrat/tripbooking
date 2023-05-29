import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: const Text('หมายเลขโทรศัพท์'),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 50.0, right: 50),
              child: TextField(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 50),
              child: const Text('รหัสผ่าน'),
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
                      onPressed: () {}, child: const Text('ลงทะเบียนใหม่')),
                  FilledButton(
                      onPressed: () {}, child: const Text('เข้าสู่ระบบ'))
                ],
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
