import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class NetworkHelper {

  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    String accountEndPoint = url;

    http.Response response = await http.get(Uri.parse(accountEndPoint));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      debugPrint(response.statusCode.toString());
    }
  }
}