import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; //location name for the UI
  String time; //time in that location
  String flag;//url to an asset flag icon
  String url; //location url for api endpoint
  bool isDaytime;


  //Constructor
  WorldTime({String location, String flag,String url}){
    this.url = url;
    this.flag = flag;
    this.location = location;
  }

  Future<void> getTime() async{

    // try and catch for error handling
    try {
      //Requesting The Api
      http.Response response = await http.get(Uri.https('worldtimeapi.org', '/api/timezone/$url'));
      Map data = jsonDecode(response.body);


      //Get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3); //creating Substring for required integer to add

      //Create Datetime Object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset))); // int.parse for converting string to int

      //Set time property to be displayed
      isDaytime = (now.hour > 6 && now.hour < 19) ? true : false;
      time = DateFormat.jm().format(now); // Formatting time in proper way from Intl package

    }
    catch(error){
      print('Caught Error : $error');
      time = 'Could not get Time!!';
    }
  }
}



