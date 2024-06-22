import 'dart:convert';

import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/auth/domain/entities/app_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _token = 'token';
const _appUser = 'appUser';
const _onBoarding = 'onBoarding';
const _searchUsersHistories = 'searchUsersHistories';
const _searchQueryHistories = 'searchQueryHistories';

class SharedPrefs {
  factory SharedPrefs() => SharedPrefs._internal();
  SharedPrefs._internal();
  static SharedPreferences? _sharedPrefs;

  static Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  static Future<void> setToken({
    required String token,
  }) async {
    if (_sharedPrefs != null) {
      await _sharedPrefs?.setString(
        _token,
        token,
      );
    }
  }

  static String? getToken() {
    return _sharedPrefs?.getString(_token);
  }

  static Future<void> setAppUser({
    required AppUser appUser,
  }) async {
    if (_sharedPrefs != null) {
      await _sharedPrefs?.setString(
        _appUser,
        jsonEncode(
          appUser.toJson()..addAll({'user_id': appUser.userId}),
        ),
      );
    }
  }

  static AppUser? getUser() {
    final appUserJson = _sharedPrefs?.getString(
      _appUser,
    );

    if (appUserJson != null) {
      return AppUser.fromJson(
        jsonDecode(appUserJson),
      );
    }
    return null;
  }

  static Future<void> setOnBoarding({
    required bool onBoarding,
  }) async {
    if (_sharedPrefs != null) {
      await _sharedPrefs?.setBool(
        _onBoarding,
        onBoarding,
      );
    }
  }

  static List<AppUser?> getUserSearchHistories() {
    final searchUsersHistories = _sharedPrefs?.getStringList(
      _searchUsersHistories,
    );

    if (searchUsersHistories != null) {
      return searchUsersHistories
          .map(
            (e) => AppUser.fromJson(
              jsonDecode(e),
            ),
          )
          .toList();
    }
    return [];
  }

  static Future<void> addUserSearchHistory({
    required AppUser appUser,
  }) async {
    if (_sharedPrefs != null) {
      final searchUsersHistories = _sharedPrefs?.getStringList(
        _searchUsersHistories,
      );

      if (searchUsersHistories != null) {
        final userJson = jsonEncode(appUser.toJson());
        if (!searchUsersHistories.contains(userJson)) {
          searchUsersHistories.add(userJson);
          await _sharedPrefs?.setStringList(
            _searchUsersHistories,
            searchUsersHistories,
          );
        }
      } else {
        await _sharedPrefs?.setStringList(
          _searchUsersHistories,
          [
            jsonEncode(
              appUser.toJson(),
            ),
          ],
        );
      }
    }
  }

  static Future<void> clearUserSearchHistoty() async {
    if (_sharedPrefs != null) {
      await _sharedPrefs?.remove(_searchUsersHistories);
    }
  }

  static Future<void> addSearchQueryHistory({
    required String query,
  }) async {
    if (_sharedPrefs != null) {
      final searchQueryHistories = _sharedPrefs?.getStringList(
        _searchQueryHistories,
      );

      if (searchQueryHistories != null) {
        if (!searchQueryHistories.contains(query)) {
          searchQueryHistories.add(query);
          await _sharedPrefs?.setStringList(
            _searchQueryHistories,
            searchQueryHistories,
          );
        }
      } else {
        await _sharedPrefs?.setStringList(
          _searchQueryHistories,
          [query],
        );
      }
    }
  }

  static List<String> getSearchQueryHistories() {
    return _sharedPrefs?.getStringList(
          _searchQueryHistories,
        ) ??
        [];
  }

  static bool getOnBoarding() {
    return _sharedPrefs?.getBool(_onBoarding) ?? false;
  }

  static Future<void> removeUser() async {
    await _sharedPrefs?.remove(_appUser);
    await _sharedPrefs?.remove(_token);
  }

  static Future<void> clear() async {
    await _sharedPrefs?.clear();
  }
}
