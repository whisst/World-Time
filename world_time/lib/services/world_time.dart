import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;  //location name for the UI
  String time;      //the time in that location
  String date;      //the date in that location
  String flag;      //url to an asset flag icon
  String url;       //location url for api endpoint
  bool isDaytime;   //true or false if daytime or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async{

    try{
      //make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      //get the properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0,3);
      //print(datetime);
      //print(offset);

      //create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      print(now);

      //set the time properties
      isDaytime = now.hour >= 6 && now.hour < 19  ? true : false;
      time = DateFormat.jm().format(now);
      date = DateFormat.yMMMMEEEEd().format(now);
      print(time);
    }
    catch(e){
      print('Caught error: $e');
      time = 'Could not get the Data';
    }
  }
}