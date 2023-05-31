import 'dart:developer';

import 'package:flutter/material.dart';

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
}
