import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://127.0.0.1:8000"; // Your FastAPI URL

  // Fetch locations from PostgreSQL
  Future<List<dynamic>> fetchLocations() async {
    final response = await http.get(Uri.parse('$baseUrl/locations'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load locations');
    }
  }
}
