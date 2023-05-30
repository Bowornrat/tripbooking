// To parse this JSON data, do
//
//     final customerGetResponse = customerGetResponseFromJson(jsonString);

import 'dart:convert';

CustomerGetResponse customerGetResponseFromJson(String str) =>
    CustomerGetResponse.fromJson(json.decode(str));

String customerGetResponseToJson(CustomerGetResponse data) =>
    json.encode(data.toJson());

class CustomerGetResponse {
  List<Record> records;

  CustomerGetResponse({
    required this.records,
  });

  factory CustomerGetResponse.fromJson(Map<String, dynamic> json) =>
      CustomerGetResponse(
        records:
            List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
      };
}

class Record {
  int idx;
  String fullname;
  String phone;
  String email;
  String image;
  String password;

  Record({
    required this.idx,
    required this.fullname,
    required this.phone,
    required this.email,
    required this.image,
    required this.password,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        idx: json["idx"],
        fullname: json["fullname"],
        phone: json["phone"],
        email: json["email"],
        image: json["image"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "idx": idx,
        "fullname": fullname,
        "phone": phone,
        "email": email,
        "image": image,
        "password": password,
      };
}
