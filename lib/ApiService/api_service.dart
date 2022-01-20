import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interview_project/utils/app_utils.dart';


class URLS {
  static const String BASE_URL = "http://restapi.adequateshop.com/api/authaccount/";
  static const String login_URL = "${BASE_URL}login";
  static const String registration_URL = "${BASE_URL}registration";
}

class ApiService {
  static final ApiService _api = ApiService._internal();

  factory ApiService() {
    return _api;
  }

  ApiService._internal();


  static Future postApiCallArgs({String url, var apiRequest}) async {
    var client = http.Client();
    try {
      print("called ----->  $url");
      debugPrint("apiRequest  $apiRequest");

      final uriResponse = await client.post(Uri.parse(url),
          body: json.encode(apiRequest),headers: {'Content-type': 'application/json'});

      debugPrint("apiStatusCode  ${uriResponse.statusCode}");

      if (uriResponse.statusCode == 200) {
        debugPrint("apiResponse : ${jsonDecode(uriResponse.body)}");
        return jsonDecode(uriResponse.body);
      } else if (uriResponse.statusCode == 400) {
        // showToast("${jsonDecode(uriResponse.body)["message"]}");
        return null;
      } else {
        // showToast("Something went wrong");
        return null;
      }
    } catch (e) {
      if (e is SocketException) {
        showToast("please check your internet connection");
      } else if (e is TimeoutException) {
        showToast("Timeout exception: ${e.toString()}");
      }
      return null;
    }
  }

}