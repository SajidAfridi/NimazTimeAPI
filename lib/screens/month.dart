import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../Models/api_response.dart';
import '../Widgets/nimaz_widget.dart';
import '../Widgets/search_widget.dart';

class Month extends StatefulWidget {
  const Month({Key? key}) : super(key: key);

  @override
  _MonthState createState() => _MonthState();
}

class _MonthState extends State<Month> {
  var month = TextEditingController();
  late StreamController _streamController;
  late Stream _stream;
  ApiResponse? apiResponse;

  void _getPrayerApi() async {
    _streamController.add('loading');
    var url = 'https://api.pray.zone/v2/times/this_month.json?city=${month.text}';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      print(response.body);
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
        title: const Text('Month'),
      ),
      body: Column(
        children: [
          SearchWidget(
              textEditingController: month,
              onPressed: () {
                if (month.text.isEmpty) {
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
                    Times? time = apiResponse!.results!.datetime![4].times;
                    Date? date = apiResponse!.results!.datetime![4].date;
                    return NamazWidgets(times: time!, date: date!);
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
