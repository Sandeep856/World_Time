import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class Worldtime {
  String location;
  late String time;
  String flag;
  String url;
  late bool isDaytime;
  Worldtime({
    required this.location,
    required this.flag,
    required this.url,
  });
  Future<void> gettime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      print(data);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // print(datetime);
      print(offset);
      DateTime now = DateTime.parse(datetime);
      now = now.add((Duration(hours: int.parse(offset))));
      time = DateFormat.jm().format(now);
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    } catch (e) {
      print('Caught an error:$e');
      time = 'Could not get time';
    }
  }
}
