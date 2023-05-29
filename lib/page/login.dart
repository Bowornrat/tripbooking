import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/images/logo.jpg'),
          const Text('หมายเลขโทรศัพท์'),
          TextField(),
          const Text('รหัสผ่าน'),
          TextField(),
          Row(
            children: [
              TextButton(onPressed: () {}, child: const Text('ลงทะเบียนใหม่')),
              FilledButton(onPressed: () {}, child: const Text('เข้าสู่ระบบ'))
            ],
          )
        ],
      ),
    );
    ;
  }
}
