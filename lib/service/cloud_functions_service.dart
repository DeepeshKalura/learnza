import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:http/http.dart' as http;

class CloudFunctionsService {
  final FirebaseFunctions functions = FirebaseFunctions.instance;

  void connectToEmulator() {
    functions.useFunctionsEmulator('localhost', 5001);
  }

  static const String createNewUser =
      'https://us-central1-learnza.cloudfunctions.net/create_new_user_by_admin';

  Future<Map<String, dynamic>> createUserByAdmin({
    required String email,
    required String role,
    required String fullName,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(createNewUser),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'role': role,
          'fullName': fullName,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return {'success': true, 'data': data};
      } else {
        return {
          'success': false,
          'error': 'Error: ${response.statusCode} ${response.body}'
        };
      }
    } catch (e) {
      return {'success': false, 'error': e.toString()};
    }
  }
}
