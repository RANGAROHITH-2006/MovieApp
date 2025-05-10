import 'dart:convert';
 import 'dart:developer';
 import 'package:http/http.dart' as http;
import 'package:movieapp/shared_utils.dart';

 class ApiServices {
   Future<String> login(String username, String password) async {
     const String loginUrl = "https://apis.ccbp.in/login";
     try {
       final Uri url = Uri.parse(loginUrl);
       final headers = {'Content-Type': 'application/json'};
       final body = jsonEncode({'username': username, 'password': password});
 
       final response = await http.post(url, headers: headers, body: body);
 
       log('Status: ${response.statusCode}');
       log('Response: ${response.body}');
 
       final Map<String, dynamic> data = jsonDecode(response.body);
 
       if (response.statusCode == 200) {
         final token = data['jwt_token'];
         SharedPreferencesUtil.saveAuthToken(token);
 
         if (token != null) {
           log('Login is successful. Token: $token');
           return token;
         } else {
           throw Exception('Token not found');
         }
       } else {
         throw Exception(data['error_msg'] ?? 'Login failed');
       }
     } catch (e) {
       log('Login error: $e');
       throw Exception(e.toString().replaceFirst('Exception:', ''));
     }
   }
 
   
 }