// To parse this JSON data, do
//
//     final currentTimezoneModel = currentTimezoneModelFromJson(jsonString);

import 'dart:convert';

CurrentTimezoneModel currentTimezoneModelFromJson(String str) =>
    CurrentTimezoneModel.fromJson(json.decode(str));

String currentTimezoneModelToJson(CurrentTimezoneModel data) =>
    json.encode(data.toJson());

class CurrentTimezoneModel {
  int? dstOffset;
  int? rawOffset;
  String? status;
  String? timeZoneId;
  String? timeZoneName;

  CurrentTimezoneModel({
    this.dstOffset,
    this.rawOffset,
    this.status,
    this.timeZoneId,
    this.timeZoneName,
  });

  factory CurrentTimezoneModel.fromJson(Map<String, dynamic> json) =>
      CurrentTimezoneModel(
        dstOffset: json["dstOffset"],
        rawOffset: json["rawOffset"],
        status: json["status"],
        timeZoneId: json["timeZoneId"],
        timeZoneName: json["timeZoneName"],
      );

  Map<String, dynamic> toJson() => {
        "dstOffset": dstOffset,
        "rawOffset": rawOffset,
        "status": status,
        "timeZoneId": timeZoneId,
        "timeZoneName": timeZoneName,
      };
}
