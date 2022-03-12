import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../Models/api_response.dart';
import '../Widgets/nimaz_widget.dart';
import '../Widgets/search_widget.dart';

class Week extends StatefulWidget {
  const Week({Key? key}) : super(key: key);

  @override
  _WeekState createState() => _WeekState();
}

class _WeekState extends State<Week> {
  var week = TextEditingController();
  late StreamController _streamController;
  late Stream _stream;
  ApiResponse? apiResponse;

  void _getPrayerApi() async {
    _streamController.add('loading');
    var url = 'https://api.pray.zone/v2/times/this_week.json?city=${week.text}';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      apiResponse = ApiResponse.fromJson(jsonData);
      _streamController.add('done');
    } else {
      _streamController.add('wrong');
    }
  }

  @override
  void initState() {
    _streamController = StreamController();
    _stream = _streamController.stream;
    _streamController.add('empty');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week'),
      ),
      body: Column(
        children: [
          SearchWidget(
              textEditingController: week,
              onPressed: () {
                if (week.text.isEmpty) {
                  Fluttertoast.showToast(msg: 'provide a city');
                } else {
                  _getPrayerApi();
                }
              }),
          StreamBuilder(
              stream: _stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data == 'loading') {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.data == 'wrong') {
                    return const Text('something went wrong');
                  } else if (snapshot.data == 'empty') {
                    return const Text('plz provide city');
                  } else if (snapshot.data == 'done') {
                    for(int i = 1;i<7;i++){
                      Times? time = apiResponse!.results!.datetime![i].times;
                      Date? date = apiResponse!.results!.datetime![i].date;
                      return NamazWidgets(times: time!, date: date!);
                    }
                    return const Text('Hello');
                  } else {
                    return const Text('some big mistake');
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })
        ],
      ),
    );
  }
}
