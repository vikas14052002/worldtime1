import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  Map data={};


  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty ?data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    String bgimage=data['isdaytime'] ? 'day.png':'night.png';
    Color? bgcolor=data['isdaytime'] ? Colors.lightBlueAccent : Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgimage'),
                  fit: BoxFit.cover,

              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120,0,0),
              child: Column(
                children: <Widget>[
                  TextButton.icon(
                      onPressed: ()async {
                        dynamic result=await Navigator.pushNamed(context,'/location');
                        setState(() {
                          data={
                            'time': result['time'],
                            'location': result['location'],
                            'flag': result['flag'],
                            'isdaytime':result['isdaytime']
                          };
                        });
                      },
                      icon: Icon(
                          Icons.edit_location,
                          color: Colors.grey[300],
                      ),
                      label: Text('Edit Location',style: TextStyle(fontSize: 20,color: Colors.white,letterSpacing: 2),),

                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(data['location'],style: TextStyle(fontSize: 28,letterSpacing: 2),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66,
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
