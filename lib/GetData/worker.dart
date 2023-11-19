import 'package:http/http.dart';
import 'dart:convert';

class worker
{

  String location;

  worker({required this.location})
  {
    location = this.location;
  }

  String? temp;
  String? humidity;
  String? air_speed;
  String? description;
  String? main;
  String? icon;



  Future<void> getData() async{

    try{

      Response response = await get("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=40bf834500cd0b947badf4dc1cd54dfa");
      Map data = jsonDecode(response.body);

      print(data);

      Map temp_data=data['main'];
      String getHumidity = temp_data['humidity'].toString();
      double getTemp = temp_data['temp'] - 273.15;

      Map wind=data['wind'];
      double getaAir_speed= wind["speed"];


      List weather_data =data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des=weather_main_data['main'];
      String getDesc = weather_main_data["description"];




      temp = getTemp.toString();
      humidity = getHumidity;
      air_speed = getaAir_speed.toString();
      description = getDesc;
      main = getMain_des;
      icon = weather_main_data["icon"].toString();



    }catch(e){

      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "Can't Find Data !";
      main = "NA";
      icon = "09d";

    }


  }


}

