import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:new1/mongoDB.dart';
import 'mongoDBModel.dart';
import 'dart:async';

class mongoDBInsert extends StatefulWidget {
  const mongoDBInsert({super.key});

  @override
  State<mongoDBInsert> createState() => _mongoDBInsertState();
}

class _mongoDBInsertState extends State<mongoDBInsert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
            future: MongoDatabase.getData(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  var totalData = snapshot.data.length;
                  print("Total Data" + totalData.toString());
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return displayCard(
                            MongoDbModel.fromJson(snapshot.data[index]));
                      });
                } else {
                  return Center(
                    child: Text("No Data Available"),
                  );
                }
              }
            }),
      )),
    );
  }

  Widget displayCard(MongoDbModel data) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          //Text("ID: " + "${data.id}"),
          //  SizedBox(height: 5),
          Text("PM2.5: " + "${data.pm25}"),
          SizedBox(height: 5),
          Text("Tempurature: " + "${data.tempurature}"),
          SizedBox(height: 5),
          Text("Humidity: " + "${data.humidity}"),
          SizedBox(height: 5),
          Text("SO2: " + "${data.so2}"),
          SizedBox(height: 5),
          Text("O3: " + "${data.o3}"),
          SizedBox(height: 5),
          Text("NO2: " + "${data.no2}"),
          SizedBox(height: 5),
          Text("CO: " + "${data.co}"),
          SizedBox(height: 5),
          Text("WindSpeed: " + "${data.windSpeed}"),
          SizedBox(height: 5),
          Text("WindDirection: " + "${data.windDirection}"),
        ],
      ),
    ));
  }
}
