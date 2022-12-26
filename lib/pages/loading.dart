import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:worldtime1/services/world_time.dart';

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {

  // void getData() async {
  //   var url=Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
  //   Response response = await get(url);
  //   Map data =jsonDecode(response.body);
  //   print(data['title']);
  // }

  // void getTime() async{
  //   var url=Uri.parse('https://worldtimeapi.org/api/timezone/Asia/Kolkata');
  //   Response response = await get(url);
  //   Map data =jsonDecode(response.body);
  //   print(data['datetime']);
  //   print(data['utc_offset']);
  //   String datetime=data['datetime'];
  //   String offset1=data['utc_offset'].substring(1,3);
  //   String offset2=data['utc_offset'].substring(4,6);
  //
  //   DateTime now=DateTime.parse(datetime);
  //   now=now.add(Duration(hours: int.parse(offset1),minutes: int.parse(offset2)));
  //   print(now);
  // }

  //String time='loading';
  void setup_world_time() async{

    WorldTime instance=WorldTime(location: 'Kolkata', flag: 'India.png', url: 'Asia/Kolkata');
    await instance.getTime();
    //print(instance.time);
    // setState(() {
    //   time=instance.time;
    // });

    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isdaytime': instance.isdaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setup_world_time();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[700],
      body: Center(
       child: SpinKitRing(
         color: Colors.white,
         size: 80.0,
       ),
      )
    );
  }
}
