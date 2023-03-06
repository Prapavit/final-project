import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new1/display.dart';
import 'package:new1/query.dart';
import 'package:new1/update.dart';
//import 'package:new1/insert.dart';
//import 'package:new1/query.dart';
import 'dart:convert';

import 'mongoDB.dart';
//import 'package:mongo_dart/mongo_dart.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(MyApp());
}

final collection = MongoDatabase.db.collection('data');

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'OpenSans',
      ),
      home: mongoDBInsert(),
    );
  }
}
