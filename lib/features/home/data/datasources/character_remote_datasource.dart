
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/core/error/exeption.dart';
import 'package:rickandmorty/features/home/data/models/character_model.dart';
import 'package:rickandmorty/features/home/domain/entities/character.dart';


abstract class CharacterRemoteDataSource {
  Future<List<CharacterEntity>> getCharacters({String? status, int page = 1});
  Future<CharacterEntity> getCharacter(int id);
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final http.Client client;

  CharacterRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CharacterEntity>> getCharacters({String? status, int page = 1}) async {
    try {
      String url = 'https://rickandmortyapi.com/api/character?page=$page';
      if (status != null) {
        url += '&status=$status';
      }

      final response = await client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, Object?> jsonResponse = jsonDecode(response.body) as Map<String, Object?>;
        final RickAndMortyResponseModel responseModel = RickAndMortyResponseModel.fromJson(jsonResponse);
        return responseModel.results.map((characterModel) => characterModel.toEntity()).toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<CharacterEntity> getCharacter(int id) async {
    try {
      final response = await client.get(Uri.parse('https://rickandmortyapi.com/api/character/$id'));

      if (response.statusCode == 200) {
        final Map<String, Object?> jsonResponse = jsonDecode(response.body) as Map<String, Object?>;
        final characterModel = CharacterModel.fromJson(jsonResponse);
        return characterModel.toEntity();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
