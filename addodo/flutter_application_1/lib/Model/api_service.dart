import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000/'; // Replace with your Django backend URL

  Future<Map<String, dynamic>> getTime() async {
    final response = await http.post(
      Uri.parse('$baseUrl/index/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'action': 'gettime'}),
    );
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getAsuult(Map<String, dynamic> payload) async {
    final response = await http.post(
      Uri.parse('$baseUrl/index/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(payload),
    );
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> setHariult(Map<String, dynamic> payload) async {
    final response = await http.post(
      Uri.parse('$baseUrl/index/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(payload),
    );
    return _processResponse(response);
  }

  Map<String, dynamic> _processResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
