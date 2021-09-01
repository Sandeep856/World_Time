import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:world_time/pages/home.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<Worldtime> locations = [
    Worldtime(
      url: 'Europe/London',
      location: 'London',
      flag: 'uk.png',
    ),
    Worldtime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    // Worldtime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    Worldtime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    Worldtime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    Worldtime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    Worldtime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    Worldtime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  // ignore: non_constant_identifier_names
  void Updatetime(index) async {
    Worldtime instance = locations[index];
    await instance.gettime();
    Navigator.pop(context, {
      'location': locations[index].location,
      'flag': locations[index].flag,
      'time': locations[index].time,
      'isDaytime': locations[index].isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  Updatetime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('lib/assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
