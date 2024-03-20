// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';

// const _token = 'token';
// const _appUser = 'appUser';

// class SharedPrefs {
//   factory SharedPrefs() => SharedPrefs._internal();
//   SharedPrefs._internal();
//   static SharedPreferences? _sharedPrefs;

//   static Future<void> init() async {
//     _sharedPrefs ??= await SharedPreferences.getInstance();
//   }

//   static Future<void> setToken({
//     required String token,
//   }) async {
//     if (_sharedPrefs != null) {
//       await _sharedPrefs?.setString(
//         _token,
//         token,
//       );
//     }
//   }

//   static String? getToken() {
//     return _sharedPrefs?.getString(_token);
//   }

//   static Future<void> setAppUser({
//     required AppUser appUser,
//   }) async {
//     if (_sharedPrefs != null) {
//       await _sharedPrefs?.setString(
//         _appUser,
//         jsonEncode(
//           appUser.toJson(),
//         ),
//       );
//     }
//   }

//   static AppUser? getUser() {
//     final appUserJson = _sharedPrefs?.getString(
//       _appUser,
//     );

//     if (appUserJson != null) {
//       return AppUser.fromJson(
//         jsonDecode(appUserJson),
//       );
//     }
//     return null;
//   }

//   static Future<void> clear() async {
//     await _sharedPrefs?.clear();
//   }
// }
