// To parse this JSON data, do
//
//     final tripGetResponse = tripGetResponseFromJson(jsonString);

import 'dart:convert';

TripGetResponse tripGetResponseFromJson(String str) =>
    TripGetResponse.fromJson(json.decode(str));

String tripGetResponseToJson(TripGetResponse data) =>
    json.encode(data.toJson());

class TripGetResponse {
  List<Record> records;

  TripGetResponse({
    required this.records,
  });

  factory TripGetResponse.fromJson(Map<String, dynamic> json) =>
      TripGetResponse(
        records:
            List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
      };
}

class Record {
  int idx;
  String name;
  String country;
  int destinationid;
  String coverimage;
  String detail;
  int price;
  int duration;

  Record({
    required this.idx,
    required this.name,
    required this.country,
    required this.destinationid,
    required this.coverimage,
    required this.detail,
    required this.price,
    required this.duration,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        idx: json["idx"],
        name: json["name"],
        country: json["country"],
        destinationid: json["destinationid"],
        coverimage: json["coverimage"],
        detail: json["detail"],
        price: json["price"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "idx": idx,
        "name": name,
        "country": country,
        "destinationid": destinationid,
        "coverimage": coverimage,
        "detail": detail,
        "price": price,
        "duration": duration,
      };
}
