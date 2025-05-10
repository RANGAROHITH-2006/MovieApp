import 'dart:developer';
 import 'package:shared_preferences/shared_preferences.dart';
 
 class SharedPreferencesUtil {
   static SharedPreferences? _prefs;
 
   // Ensures the instance is initialized
   static Future<SharedPreferences> get _instance async {
     if (_prefs != null) return _prefs!;
     _prefs = await SharedPreferences.getInstance();
     return _prefs!;
   }
 
   // Initialize manually (optional if using _instance getter fallback)
   static Future<void> init() async {
     log('🔹 Initializing SharedPreferences...');
     _prefs = await SharedPreferences.getInstance();
     log(_prefs == null
         ? '❌ SharedPreferences failed to initialize!'
         : '✅ SharedPreferences initialized successfully!');
   }
 
   // Set a string
   static Future<bool> setString(String key, String value) async =>
       (await _instance).setString(key, value);
 
   // Get a string
   static Future<String> getString(String key) async =>
       (await _instance).getString(key) ?? "";
 
   // Remove a value
   static Future<void> removeValue(String key) async =>
       (await _instance).remove(key);
 
   // Clear all preferences
   static Future<void> clearPreferences() async => (await _instance).clear();
 
   // Save auth token
   static Future<void> saveAuthToken(String token) async {
     log('Saving Auth Token: $token');
     await setString('auth_token', token);
   }
 
   // Retrieve auth token
   static Future<String?> getAuthToken() async {
     String token = await getString('auth_token');
     log('Retrieved Auth Token: $token');
     return token.isNotEmpty ? token : null;
   }
 }