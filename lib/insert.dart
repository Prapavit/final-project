import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:new1/display.dart';
import 'package:new1/mongoDB.dart';
import 'package:new1/mongoDBModel.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class MongoDbInsert extends StatefulWidget {
  MongoDbInsert({Key? key}) : super(key: key);

  @override
  _MongoDbInsertState createState() => _MongoDbInsertState();
}

class _MongoDbInsertState extends State<MongoDbInsert> {
  var pm25Controller = new TextEditingController();
  var tempuratureController = new TextEditingController();
  var humidityController = new TextEditingController();
  var so2Controller = new TextEditingController();
  var o3Controller = new TextEditingController();
  var no2Controller = new TextEditingController();
  var coController = new TextEditingController();
  var windSpController = new TextEditingController();
  var windDiController = new TextEditingController();

  var _checkInsertUpdate = "Insert";
  @override
  Widget build(BuildContext context) {
    MongoDbModel data =
        ModalRoute.of(context)!.settings.arguments as MongoDbModel;
    if (data != null) {
      pm25Controller.text = data.pm25;
      tempuratureController.text = data.tempurature;
      humidityController.text = data.humidity;
      so2Controller.text = data.so2;
      o3Controller.text = data.o3;
      no2Controller.text = data.no2;
      coController.text = data.co;
      windSpController.text = data.windSpeed;
      windDiController.text = data.windDirection;
      _checkInsertUpdate = "Update";
    }
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              _checkInsertUpdate,
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 30),
            TextField(
              controller: pm25Controller,
              decoration: InputDecoration(labelText: "PM2.5"),
            ),
            TextField(
              controller: tempuratureController,
              decoration: InputDecoration(labelText: "Tempurature"),
            ),
            TextField(
              controller: humidityController,
              decoration: InputDecoration(labelText: "Humidity"),
            ),
            TextField(
              controller: so2Controller,
              decoration: InputDecoration(labelText: "SO2"),
            ),
            TextField(
              controller: o3Controller,
              decoration: InputDecoration(labelText: "O3"),
            ),
            TextField(
              controller: no2Controller,
              decoration: InputDecoration(labelText: "NO2"),
            ),
            TextField(
              controller: coController,
              decoration: InputDecoration(labelText: "CO"),
            ),
            TextField(
              controller: windSpController,
              decoration: InputDecoration(labelText: "WindSpeed"),
            ),
            TextField(
              controller: windDiController,
              decoration: InputDecoration(labelText: "WindDirection"),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                    onPressed: () {
                      _fakeData();
                    },
                    child: Text("Genarate Data")),
                ElevatedButton(
                    onPressed: () {
                      if (_checkInsertUpdate == "Update") {
                      } else {}
                      _insertData(
                          pm25Controller.text,
                          tempuratureController.text,
                          humidityController.text,
                          so2Controller.text,
                          o3Controller.text,
                          no2Controller.text,
                          coController.text,
                          windSpController.text,
                          windDiController.text);
                    },
                    child: Text(_checkInsertUpdate)),
              ],
            )
          ],
        ),
      )),
    );
  }

  Future<void> _updateData(
      var id,
      String pm25,
      String tempurature,
      String humidity,
      String so2,
      String o3,
      String no2,
      String co,
      String windSpeed,
      String windDirection) async {
    final updateData = MongoDbModel(
        id: id,
        pm25: pm25,
        tempurature: tempurature,
        humidity: humidity,
        so2: so2,
        o3: o3,
        no2: no2,
        co: co,
        windSpeed: windSpeed,
        windDirection: windDirection);
  }

  Future<void> _insertData(
      String pm25,
      String tempurature,
      String humidity,
      String so2,
      String o3,
      String no2,
      String co,
      String windSpeed,
      String windDirection) async {
    var _id = M.ObjectId();
    final data = MongoDbModel(
        id: _id,
        pm25: pm25,
        tempurature: tempurature,
        humidity: humidity,
        so2: so2,
        o3: o3,
        no2: no2,
        co: co,
        windSpeed: windSpeed,
        windDirection: windDirection);
    var result = await MongoDatabase.insert(data);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Inserted ID " + _id.$oid)));
    _clearall();
  }

  void _clearall() {
    pm25Controller.text = "";
    tempuratureController.text = "";
    humidityController.text = "";
    so2Controller.text = "";
    o3Controller.text = "";
    no2Controller.text = "";
    coController.text = "";
    windSpController.text = "";
    windDiController.text = "";
  }

  void _fakeData() {
    setState(() {
      pm25Controller.text = faker.person.firstName();
      tempuratureController.text = faker.person.firstName();
      humidityController.text = faker.person.firstName();
      so2Controller.text = faker.person.firstName();
      o3Controller.text = faker.person.firstName();
      no2Controller.text = faker.person.firstName();
      coController.text = faker.person.firstName();
      windSpController.text = faker.person.firstName();
      windDiController.text = faker.person.firstName();
    });
  }
}
