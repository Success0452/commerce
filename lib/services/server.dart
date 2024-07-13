import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String baseUrl = 'https://api.escuelajs.co/api/v1';
final Future<SharedPreferences> _preference = SharedPreferences.getInstance();

Future<http.Response> postWTRequest(
    String endpoint, Map<String?, dynamic> data) async {
  debugPrint(data.toString());
  final response = await http.post(
    Uri.parse('$baseUrl/$endpoint'),
    headers: <String, String>{'Content-Type': 'application/json'},
    body: jsonEncode(data),
  );
  print('$baseUrl/$endpoint');
  print(response.body);

  return response;
}

Future<http.Response> postRequest(
    String endpoint, Map<String?, dynamic> data) async {
  debugPrint(data.toString());
  final SharedPreferences sharedPreferences = await _preference;
  var token = sharedPreferences.getString('access_token');
  final response = await http.post(
    Uri.parse('$baseUrl/$endpoint'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    },
    body: jsonEncode(data),
  );

  return response;
}

Future<http.Response> patchRequest(
    String endpoint, Map<String, dynamic> data) async {
  final SharedPreferences sharedPreferences = await _preference;
  var token = sharedPreferences.getString('access_token');
  final response = await http.patch(
    Uri.parse('$baseUrl/$endpoint'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    },
    body: jsonEncode(data),
  );

  return response;
}

Future<http.Response> putRequest(
    String endpoint, Map<String, dynamic> data) async {
  final SharedPreferences sharedPreferences = await _preference;
  var token = sharedPreferences.getString('access_token');
  final response = await http.put(
    Uri.parse('$baseUrl/$endpoint'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    },
    body: jsonEncode(data),
  );

  return response;
}

Future<http.Response> getRequest(String endpoint) async {
  print('$baseUrl/$endpoint');
  final SharedPreferences sharedPreferences = await _preference;
  var token = sharedPreferences.getString('access_token');
  print(token);
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  };
  final response = await http.get(
    Uri.parse('$baseUrl/$endpoint'),
    headers: headers,
  );

  return response;
}

Future<http.Response> deleteRequest(String endpoint) async {
  final SharedPreferences sharedPreferences = await _preference;
  var token = sharedPreferences.getString('access_token');
  final response = await http.delete(
    Uri.parse('$baseUrl/$endpoint'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    },
  );

  return response;
}

Future<http.Response> uploadFileRequest(
    String endpoint, String filePath, String key) async {
  final SharedPreferences sharedPreferences = await _preference;
  var token = sharedPreferences.getString('access_token');

  var headers = {'Authorization': 'Bearer $token'};
  var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/$endpoint'));
  request.files.add(await http.MultipartFile.fromPath(key, filePath));
  request.headers.addAll(headers);

  http.StreamedResponse streamedResponse = await request.send();
  http.Response response = await http.Response.fromStream(streamedResponse);

  return response;
}
