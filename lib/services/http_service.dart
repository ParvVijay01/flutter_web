import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:portfolio/model/category_model.dart';
import 'package:portfolio/model/photo_model.dart';
import 'package:portfolio/utility/constants.dart';

class HttpService {
  static const String baseUrl = MAIN_URL; // Update with actual URL

  // Fetch Categories
  static Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/api/categories'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'] as List;
      return data.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  // Fetch Photos by Category
  static Future<List<Photo>> fetchPhotosByCategory(String categoryId) async {
    try {
      final url = '$baseUrl/api/photos/category/$categoryId';
      print('Fetching photos from: $url'); // Debugging log

      final response = await http.get(Uri.parse(url));

      print('Response Status Code: ${response.statusCode}'); // Debugging log
      print('Response Body: ${response.body}'); // Debugging log

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        return data.map((json) => Photo.fromJson(json)).toList();
      } else {
        print('Failed to load photos. Status: ${response.statusCode}');
        return []; // Return empty list instead of throwing error
      }
    } catch (e) {
      print('Exception: $e');
      return []; // Ensure function doesn't throw an error
    }
  }
}
