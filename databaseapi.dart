import 'dart:convert';
import 'dart:io';

import 'package:flixxiewatch/jsoncalling.dart';
import 'package:http/http.dart' as http;

Future<DataBase> fetchMovies() async {
  try {
    final response = await http.get(
      Uri.parse(
        "https://raw.githubusercontent.com/Boluwatife90/avengerapi/refs/heads/main/db.json",
      ),
    );

    if (response.statusCode == 200) {
      return DataBase.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load movies: ${response.statusCode}');
    }
  } on SocketException catch (_) {
    throw Exception('Please check your internet connection and try again.');
  } on http.ClientException catch (_) {
    // This is another type of exception that might occur with network issues
    throw Exception('Network error. Please check your connection.');
  } catch (e) {
    throw Exception('An error occurred: ${e.toString()}');
  }
}
