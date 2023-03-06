// ignore: file_names
import 'package:mongo_dart/mongo_dart.dart';
import 'package:new1/mongoDBModel.dart';
import 'constant.dart';
import 'dart:developer';

class MongoDatabase {
  static var db, collection;
  static connect() async {
    db = await Db.create(MONGO_URL);
    await db.open();
    collection = db.collection(COLLECTION_NAME);
    var status = db.serverStatus();
    print(status);
    inspect(db);
    print(await collection.find().toList());
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final arrData = await collection.find().toList();
    return arrData;
  }

  static Future<String> insert(MongoDbModel data) async {
    try {
      var result = await collection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data Inserted";
      } else {
        return "Cannot Inserted";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  static Future<List<Map<String, dynamic>>> getQueryData() async {
    final data = await collection.find(where).toList();
    return data;
  }
}
