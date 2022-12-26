import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:worldtime1/services/world_time.dart';

class WorldTime{
  late String location; //location name for UI
  late String time; // time of the location
  late String flag; //url to asset flag icon
  late String url;

  late bool isdaytime;

  WorldTime({required this.location,required this.flag,required this.url});

  Future <void> getTime() async{
    try{
      var url1=Uri.parse('https://worldtimeapi.org/api/timezone/$url');
      Response response = await get(url1);
      Map data =jsonDecode(response.body);

      String datetime=data['datetime'];
      String offset1=data['utc_offset'].substring(1,3);
      String offset2=data['utc_offset'].substring(4,6);

      DateTime now=DateTime.parse(datetime);
      now=now.add(Duration(hours: int.parse(offset1),minutes: int.parse(offset2)));

      isdaytime=(now.hour>6 && now.hour<18)?true:false;
      time=DateFormat.jm().format(now);
      //time=now.toString();
      //print(time);
    }
    catch (e){
      print('caught null value: $e');
      time='unable to capture';
    }
  }

}

//WorldTime instance=WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');