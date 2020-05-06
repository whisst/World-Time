import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Ha Noi', flag: 'vietnam.png', url: 'Asia/Ho_Chi_Minh');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
      'date': instance.date,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 170.0, 0.0, 0.0),
        child: Column(
          children: <Widget>[
            Text(
              'World Time',
              style: TextStyle(
                fontSize: 50.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 70.0),
            Center(
              child: SpinKitFadingCube(
                color: Colors.white,
                size: 50.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
