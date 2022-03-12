import 'package:flutter/material.dart';

import '../Models/api_response.dart';
class NamazWidgets extends StatelessWidget {
  final Times times;
  final Date date;
  const NamazWidgets({
    Key? key,required this.times,required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildCard('Date', date.gregorian.toString()),
          buildCard('Fajr', times.fajr.toString()),
          buildCard('Dhudr', times.dhuhr.toString()),
          buildCard('Asar', times.asr.toString()),
          buildCard('Maghrib', times.maghrib.toString()),
          buildCard('Isha', times.isha.toString()),
        ],
      ),
    );
  }

  Card buildCard(String time, String value) {
    return Card(
    elevation: 5,
    color: Colors.blueGrey,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: ListTile(
      onTap: (){},
      contentPadding: const EdgeInsets.symmetric(horizontal: 50),
      horizontalTitleGap: 50,
      leading: Text(time,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w400),),
      title: Text(value,style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.bold),),
    ),
  );
  }
}