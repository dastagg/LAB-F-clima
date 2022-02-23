import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocation();

  }

  void getLocation() async {
    Location location =  Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }


  void getData() async {
    String accountEndPoint = '<url goes here>'
    http.Response response = await http.get(Uri.parse(accountEndPoint));
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(15.0),
        color: Colors.red,
      ),
    );
  }
}
