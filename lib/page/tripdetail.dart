import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tripbooking/config.dart';
import 'package:tripbooking/model/trip_get_res.dart';

class TripDetailPage extends StatefulWidget {
  int idx = 0;
  // Constructor คือ method ที่ทำงานทันทีเมื่อสร้าง object
  TripDetailPage({super.key, required this.idx});

  @override
  State<TripDetailPage> createState() => _TripDetailPageState();
}

class _TripDetailPageState extends State<TripDetailPage> {
  @override
  Widget build(BuildContext context) {
    log(widget.idx.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลทริป'),
      ),
      body: Container(),
    );
  }

  // Method สำหรับโหลดข้อมูลที่เป็น Async
  Future<void> loadDataAsync() async {
    // 1. Gen url
    var url = '$apiEndpoint/trip?filter=idx,eq,${widget.idx}';

    // 2. Call Api
    var response = await http.get(Uri.parse(url));

    // 3. Convert JSON to model
    var trip = tripGetResponseFromJson(response.body);
  }
}
