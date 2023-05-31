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
      body: Column(
        children: [
          // แสดงปุ่มปลายทาง
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ข้อความว่า ปลายทาง
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text('ปลายทาง'),
              ),
              // ปุ่ม ปลายทาง หลายๆปุ่ม
              Padding(
                padding: const EdgeInsets.all(8.0),
                // ปุ่มหลายปุ่มจะล้นจอ เลยต้องใส่ SingleChildScrollView
                // โดยให้เลื่อนได้ทางแนวนอน scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  // ปุ่มปลายทางหลายๆปุ่ม
                  child: Row(
                    children: [
                      FilledButton(
                          onPressed: () {
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
                          },
                          child: Text('ทั้งหมด')),

                      // ปุ่ม เอเชีย
                      FilledButton(
                          onPressed: () => getTrip(1), child: Text('เอเชีย')),
                      FilledButton(
                          onPressed: () => getTrip(2), child: Text('ยุโรป')),
                      FilledButton(
                          onPressed: () => getTrip(3), child: Text('อาเซียน')),
                      FilledButton(
                          onPressed: () => getTrip(9), child: Text('ไทย')),
                    ],
                  ),
                ),
              )
            ],
          ),
          // แสดงข้อมูลทริปที่ loop
          Expanded(
            child: Container(
              child: (isLoaded == false)
                  ? Container()
                  : SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView(
                            children: trips.records.map((e) {
                              return Card(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(e.name),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          e.coverimage,
                                          width: 200,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('ประเทศ${e.country}'),
                                            Text('ระยะเวลา ${e.duration} วัน'),
                                            Text('ราคา ${e.price} บาท'),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
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
                              ));
                            }).toList(),
                          )),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  void getTrip(int destinationid) {
    // 1. Generate URL
    var url = '$apiEndpoint/trip?filter=destinationid,eq,$destinationid';

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
}
