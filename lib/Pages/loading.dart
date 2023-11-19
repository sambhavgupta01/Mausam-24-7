import 'package:flutter/material.dart';
import 'package:mausam/GetData/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? temp;
  String? hum;
  String? air_speed;
  String? des;
  String? main;
  String city = "Mumbai";
  String? icon;

  void startApp(String city) async {
    worker instance = worker(location: city);
    await instance.getData();
    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home',arguments: {
        "temp_value" : temp,
        "hum_value" : hum,
        "air_speed_value" : air_speed,
        "des_value" : des,
        "main_value" : main,
        "city_value" :city,
        "icon_value" : icon,

      } );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)?.settings.arguments as Map?;
    if(search?.isNotEmpty ?? false){
      city = search?['searchText'];
    }
    startApp(city);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 180,),
              Image.asset(
                "images/mlogo.png",
                height: 220,
                width: 220,
              ),
              Text(
                "Mausam App",
                style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.w500,
                color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Made By Sambhav",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40,),
              SpinKitWave(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}
