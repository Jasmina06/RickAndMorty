import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rickandmorty/features/screen/data/models/location_model.dart';

abstract class LocationLocalDataSource {
  Future<void> cacheLocations(List<LocationModel> locations);
  Future<List<LocationModel>> getCachedLocations();
}

class LocationLocalDataSourceImpl implements LocationLocalDataSource {
  static const String _cachedLocationsKey = 'CACHED_LOCATIONS';

  @override
  Future<void> cacheLocations(List<LocationModel> locations) async {
    final prefs = await SharedPreferences.getInstance();
    // Преобразуем список моделей в JSON строку
    final jsonString = jsonEncode(locations.map((location) => location.toJson()).toList());
    // Сохраняем в SharedPreferences
    await prefs.setString(_cachedLocationsKey, jsonString);
  }

  @override
  Future<List<LocationModel>> getCachedLocations() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_cachedLocationsKey);
    
    if (jsonString == null) {
      throw Exception('There is no data in the cache');
    }

    // Парсим JSON строку обратно в список объектов LocationModel
    final List<Map<String, Object?>> jsonList = List<Map<String, Object?>>.from(jsonDecode(jsonString));
    return jsonList.map((json) => LocationModel.fromJson(json)).toList();
  }
}
