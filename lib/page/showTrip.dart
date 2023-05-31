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
                height: 230,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(trips.records[0].name),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                // ImageNetwork(
                                //   image: trips.records[0].coverimage,
                                //   width: 200,
                                //   height: 150,
                                // )
                                Image.network(
                              trips.records[0].coverimage,
                              width: 200,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('ประเทศ${trips.records[0].country}'),
                                Text(
                                    'ระยะเวลา ${trips.records[0].duration} วัน'),
                                Text('ราคา ${trips.records[0].price} บาท'),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: FilledButton(
                                      onPressed: () {},
                                      child: Text('รายละเอียด')),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  )),
                ),
              ),
      ),
    );
  }
}
