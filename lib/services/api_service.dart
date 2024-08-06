import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  final String baseUrl;

  APIService({required this.baseUrl});

  Future<T> get<T>(String endpoint, T Function(dynamic) fromJson) async {
    final response = await http.get(Uri.parse('$baseUrl$endpoint'));
    return _handleResponse(response, fromJson);
  }

  Future<T> post<T>(String endpoint, Map<String, dynamic> body, T Function(dynamic) fromJson) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    return _handleResponse(response, fromJson);
  }

  Future<T> put<T>(String endpoint, Map<String, dynamic> body, T Function(dynamic) fromJson) async {
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    return _handleResponse(response, fromJson);
  }

  Future<T> delete<T>(String endpoint, T Function(dynamic) fromJson) async {
    final response = await http.delete(Uri.parse('$baseUrl$endpoint'));
    return _handleResponse(response, fromJson);
  }

  Future<T> patch<T>(String endpoint, Map<String, dynamic> body, T Function(dynamic) fromJson) async {
    final response = await http.patch(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    return _handleResponse(response, fromJson);
  }

  T _handleResponse<T>(http.Response response, T Function(dynamic) fromJson) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}