import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rickandmorty/features/home/data/models/character_model.dart';

// Определение абстрактного класса для локального источника данных
abstract class CharacterLocalDataSource {
  Future<void> cacheCharacters(List<CharacterModel> characters);
  Future<List<CharacterModel>> getCachedCharacters();
  Future<void> clearCache();
}

// Реализация локального источника данных
class CharacterLocalDataSourceImpl implements CharacterLocalDataSource {
  static const String _cachedCharactersKey = 'CACHED_CHARACTERS';

  final SharedPreferences sharedPreferences;

  // Передаем `SharedPreferences` в конструктор
  CharacterLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheCharacters(List<CharacterModel> characters) async {
    // Преобразуем список моделей в JSON строку и сохраняем в SharedPreferences
    final jsonString = jsonEncode(characters.map((character) => character.toJson()).toList());
    await sharedPreferences.setString(_cachedCharactersKey, jsonString);
  }

  @override
  Future<List<CharacterModel>> getCachedCharacters() async {
    // Получаем строку JSON из SharedPreferences
    final jsonString = sharedPreferences.getString(_cachedCharactersKey);
    
    if (jsonString == null) {
      throw Exception('There is no data in the cache');
    }

    // Парсим JSON строку обратно в список объектов CharacterModel
    final List<Map<String, Object?>> jsonList = List<Map<String, Object?>>.from(jsonDecode(jsonString));
    return jsonList.map((json) => CharacterModel.fromJson(json)).toList();
  }

  @override
  Future<void> clearCache() async {
    // Удаляем закешированные данные
    await sharedPreferences.remove(_cachedCharactersKey);
  }
}
  