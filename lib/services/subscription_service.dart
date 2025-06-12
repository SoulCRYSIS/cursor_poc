import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/subscription.dart';

class SubscriptionService {
  static const String baseUrl = 'http://localhost:8080/api/v1';

  /// Calls the Go GetAllSubscriptions function
  /// Returns a list of subscriptions from the server
  static Future<List<Subscription>> getAllSubscriptions() async {
    try {
      final url = Uri.parse('$baseUrl/subscriptions/');

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Subscription.fromJson(json)).toList();
      } else {
        throw HttpException(
          'Failed to fetch subscriptions. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (e is SocketException) {
        throw Exception(
          'Network error: Unable to connect to server at $baseUrl',
        );
      } else if (e is FormatException) {
        throw Exception('Invalid response format from server');
      } else {
        throw Exception('Failed to fetch subscriptions: $e');
      }
    }
  }
}
