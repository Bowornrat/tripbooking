import 'package:flutter/material.dart';
import 'package:tripbooking/config.dart';

class ShowTripPage extends StatefulWidget {
  const ShowTripPage({super.key});

  @override
  State<ShowTripPage> createState() => _ShowTripPageState();
}

class _ShowTripPageState extends State<ShowTripPage> {
  @override
  void initState() {
    super.initState();
    // 1. Generate URL
    var url = '$apiEndpoint/trip';

    // 2. Create Model for trips
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายการทริป'),
      ),
      body: Container(),
    );
  }
}
