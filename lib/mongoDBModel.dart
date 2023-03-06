// To parse this JSON data, do
//
//     final mongoDbModel = mongoDbModelFromJson(jsonString);
import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel mongoDbModelFromJson(String str) =>
    MongoDbModel.fromJson(json.decode(str));

String mongoDbModelToJson(MongoDbModel data) => json.encode(data.toJson());

class MongoDbModel {
  MongoDbModel({
    required this.id,
    required this.pm25,
    required this.tempurature,
    required this.humidity,
    required this.so2,
    required this.o3,
    required this.no2,
    required this.co,
    required this.windSpeed,
    required this.windDirection,
  });

  ObjectId id;
  var pm25;
  var tempurature;
  var humidity;
  var so2;
  var o3;
  var no2;
  var co;
  var windSpeed;
  var windDirection;

  factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
        id: json["_id"],
        pm25: json["pm25"],
        tempurature: json["tempurature"],
        humidity: json["humidity"],
        so2: json["so2"],
        o3: json["o3"],
        no2: json["no2"],
        co: json["co"],
        windSpeed: json["windSpeed"],
        windDirection: json["windDirection"],
      );

  get time => null;

  Map<String, dynamic> toJson() => {
        "_id": id,
        "pm25": pm25,
        "tempurature": tempurature,
        "humidity": humidity,
        "so2": so2,
        "o3": o3,
        "no2": no2,
        "co": co,
        "windSpeed": windSpeed,
        "windDirection": windDirection,
      };
}
