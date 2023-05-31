import 'package:flutter/material.dart';

class TripDetailPage extends StatefulWidget {
  const TripDetailPage({super.key});

  @override
  State<TripDetailPage> createState() => _TripDetailPageState();
}

class _TripDetailPageState extends State<TripDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลทริป'),
      ),
      body: Container(),
    );
  }
}
