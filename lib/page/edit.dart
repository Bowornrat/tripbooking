import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripbooking/config.dart';
import 'package:tripbooking/model/customer_get_res.dart';
import 'package:tripbooking/model/customer_post_req.dart';
import 'package:http/http.dart' as http;
import 'package:tripbooking/page/login.dart';
import 'package:tripbooking/page/showTrip.dart';

class EditPage extends StatefulWidget {
  // รับข้อมูล idx มาทาง Contructor
  int idx = 0;
  EditPage({super.key, required this.idx});

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

  var imageCtl = TextEditingController();

  // ตัวแปรที่เก็บข้อมูล user คนนี้
  late CustomerGetResponse customer;

  // Async method สำหรับ load ข้อมูลของ user คนนี้
  Future<void> loadData() async {
    var url = '$apiEndpoint/customer?filter=idx,eq,${widget.idx}';
    var response = await http.get(Uri.parse(url));
    customer = customerGetResponseFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แก้ไขข้อมูลส่วนตัว'),
      ),

      //  ทำ FutureBuilder เพื่อ load ข้อมูล
      body: FutureBuilder(
          future: loadData(),
          builder: (context, snapshot) {
            // ถ้า load ข้อมูล ยังไม่เสร็จให้โชว์ Container()
            if (snapshot.connectionState != ConnectionState.done) {
              return Container();
            }
            // ถ้า load เสร็จแล้ว ก็แสดง ข้อมูล
            fullnameCtl.text = customer.records[0].fullname;
            phoneCtl.text = customer.records[0].phone;
            emailCtl.text = customer.records[0].email;
            imageCtl.text = customer.records[0].image;
            return SingleChildScrollView(
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
                    const Text('รูปภาพ'),
                    TextField(
                      controller: imageCtl,
                    ),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: FilledButton(
                          onPressed: () async {
                            var url = '$apiEndpoint/customer/${widget.idx}';
                            // เตรียมข้อมูลก่อนส่งไป update
                            var cus = CustomerPostRequest(
                                fullname: fullnameCtl.text,
                                phone: phoneCtl.text,
                                email: emailCtl.text,
                                image: imageCtl.text,
                                password: customer.records[0].password);
                            // ส่งข้อมูลไป update โดย method PUT
                            // PUT จะคล้าย POST ดังนั้นต้องมี body มาด้วย
                            var response = await http.put(Uri.parse(url),
                                body: customerPostRequestToJson(cus));
                            log(response.body);
                            Get.to(() => ShowTripPage());
                          },
                          child: const Text('บันทึกข้อมูล')),
                    )),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
