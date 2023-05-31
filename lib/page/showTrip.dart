import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tripbooking/config.dart';
import 'package:http/http.dart' as http;
import 'package:tripbooking/model/trip_get_res.dart';

class ShowTripPage extends StatefulWidget {
  const ShowTripPage({super.key});

  @override
  State<ShowTripPage> createState() => _ShowTripPageState();
}

class _ShowTripPageState extends State<ShowTripPage> {
  // Global variables
  late TripGetResponse trips;
  bool isLoaded = false;
  // InitState cannot be async
  @override
  void initState() {
    super.initState();
    // 1. Generate URL
    var url = '$apiEndpoint/trip';

    // 2. Create Model for trips

    // 3. Call Api
    http.get(Uri.parse(url)).then((value) {
      // Success
      // log(value.body);

      // 4. Convert JSON to Model
      trips = tripGetResponseFromJson(value.body);
      log(trips.records.length.toString());

      // 5. set isLoaded and re-render UI
      setState(() {
        isLoaded = true;
      });
    }).onError((error, stackTrace) {
      // Error
      log(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายการทริป'),
      ),
      body: Container(
        child: (isLoaded == false)
            ? Container()
            : SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Card(
                    child: Column(
                  children: [
                    Text(trips.records[0].name),
                    Row(
                      children: [
                        Image.network(
                          trips.records[0].coverimage,
                          width: 200,
                        ),
                        Column(
                          children: [
                            Text('ประเทศ${trips.records[0].country}'),
                            Text('ระยะเวลา ${trips.records[0].duration} วัน'),
                            Text('ราคา ${trips.records[0].price} บาท'),
                            FilledButton(
                                onPressed: () {},
                                child: Text('รายละเอียดเพิ่มเติม'))
                          ],
                        )
                      ],
                    )
                  ],
                )),
              ),
      ),
    );
  }
}
