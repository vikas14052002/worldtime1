import 'package:flutter/material.dart';
import 'package:worldtime1/services/world_time.dart';
class Choose_location extends StatefulWidget {
  const Choose_location({Key? key}) : super(key: key);

  @override
  State<Choose_location> createState() => _Choose_locationState();
}

class _Choose_locationState extends State<Choose_location> {
  int counter=0;
  // void getData() async {
  //   String username=await Future.delayed(Duration(seconds: 3),(){
  //     return 'Thanos';
  //   });
  //
  //
  //   String bio=await Future.delayed(Duration(seconds: 2),(){
  //     return 'Iron man';
  //   });
  //
  //   print('$username -- $bio');
  // }
  //
  //
  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }
  List<WorldTime> locations=[
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  
  void updatetime(index) async{
    WorldTime instance=locations[index];
    await instance.getTime();
    
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isdaytime': instance.isdaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.redAccent[200],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updatetime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
      )
    );
  }
}
