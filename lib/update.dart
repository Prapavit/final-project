// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:new1/insert.dart';
import 'package:new1/mongoDB.dart';
import 'package:new1/mongoDBModel.dart';

class MongoDbUpdate extends StatefulWidget {
  const MongoDbUpdate({super.key});

  @override
  State<MongoDbUpdate> createState() => _MongoDbUpdateState();
}

class _MongoDbUpdateState extends State<MongoDbUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: FutureBuilder(
                future: MongoDatabase.getData(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return displayCard(
                                MongoDbModel.fromJson(snapshot.data[index]));
                          });
                    } else {
                      return Center(
                        child: Text("No Data Found"),
                      );
                    }
                  }
                })));
  }

  Widget displayCard(MongoDbModel data) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) {
                          return MongoDbInsert();
                        },
                        settings: RouteSettings(arguments: data)));
              },
              icon: Icon(Icons.edit))
        ],
      ),
    ));
  }
}
