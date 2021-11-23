import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String? location; //location name for UI
  String? time; //time for that location
  String? flag; //url to an asset flag icon
  String? url; //location url for api endpoint

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    Response response =
        await get(Uri.parse('http://worldtimeapi.org/api/timezone/${url}'));
    Map data = jsonDecode(response.body);
    // print(data);

    //get properties
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    // print(dateTime);
    // print(offset);

    //create DateTime object

    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));

    //set the time property
    time = now.toString();
    // print(now);
  }
}
