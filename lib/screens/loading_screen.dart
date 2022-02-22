import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

    void getLocation() async {
      print('Im getting the position');
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
        // forceAndroidLocationManager: true);
      print('I have this as position: $position');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            elevation: 5,
            padding: const EdgeInsets.all(12.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          onPressed: () {
            getLocation();
            print("I got? location.");
          },
          child: const Text(
            'Get Location',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
