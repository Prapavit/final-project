import 'package:flutter/material.dart';
import 'package:new1/mongoDB.dart';
import 'package:new1/mongoDBModel.dart';

class QueryDatabase extends StatefulWidget {
  const QueryDatabase({Key? key}) : super(key: key);

  @override
  State<QueryDatabase> createState() => _QueryDatabaseState();
}

class _QueryDatabaseState extends State<QueryDatabase> {
  late Future<MongoDbModel> _latestDataFuture;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<MongoDbModel>(
          future: _latestDataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return displaydata(snapshot.data!);
            } else {
              return Center(
                child: Text("Data Not Found"),
              );
            }
          },
        ),
      ),
    );
  }

  Widget displaydata(MongoDbModel data) {
    return Card(
      child: Column(
        children: [
          Text(
            "${data.pm25} ${data.so2}",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
