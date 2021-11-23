import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for UI
  String? time; //time for that location
  String? flag; //url to an asset flag icon
  String? url; //location url for api endpoint
  bool? isDay;

  WorldTime({required this.location, this.flag, this.url, this.isDay});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/${url}'));
      Map data = jsonDecode(response.body);
      // print(data);

      //get properties
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);
      // print(dateTime);
      // print(offset);

      //create DateTime object

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));


      //set the time property
      isDay = now.hour > 6 && now.hour < 19;
      time = DateFormat.jm().format(now);
      // print(now);
    } catch (e) {
      time = 'Could not get time';
    }
  }
}
