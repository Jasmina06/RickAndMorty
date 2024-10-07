import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/core/error/exeption.dart';
import 'package:rickandmorty/features/screen_episode/data/models/episode_model.dart';

abstract class IEpisodeRemoteDataSource {
  Future<EpisodeResponseModel> fetchEpisodes(int page);
  Future<EpisodeModel> fetchEpisodeDetail(int id);
}

class EpisodeRemoteDataSourceImpl implements IEpisodeRemoteDataSource {
  final http.Client client;

  EpisodeRemoteDataSourceImpl({required this.client});

  @override
  Future<EpisodeResponseModel> fetchEpisodes(int page) async {
    try {
      final response = await client.get(Uri.parse('https://rickandmortyapi.com/api/episode?page=$page'));
      log('Status Code for Episodes: ${response.statusCode}');
      if (response.statusCode == 200) {
        final Map<String, Object?> jsonResponse = jsonDecode(response.body);
        log('Episodes data: ${response.body}'); 
        return EpisodeResponseModel.fromJson(jsonResponse);
      } else {
        log('Failed to load episodes. Status code: ${response.statusCode}');
        throw ServerException(); 
      }
    } catch (e) {
      log('Error loading episodes: $e');
      throw ServerException(); 
    }
  }

  @override
  Future<EpisodeModel> fetchEpisodeDetail(int id) async {
    try {
      // Делаем запрос к API для получения деталей эпизода
      final response = await client.get(Uri.parse('https://rickandmortyapi.com/api/episode/$id'));
      log('Status Code for Episode Detail: ${response.statusCode}');
      
      if (response.statusCode == 200) {
        final Map<String, Object?> jsonResponse = jsonDecode(response.body);
        log('Episode Detail data: ${response.body}'); 
        return EpisodeModel.fromJson(jsonResponse);
      } else {
        log('Failed to load episode details. Status code: ${response.statusCode}');
        throw ServerException(); 
      }
    } catch (e) {
      log('Error loading episode detail for ID $id: $e'); // Логирование ошибки
      throw ServerException();
    }
  }
}
