import 'dart:convert';
import 'package:rickandmorty/features/screen_episode/data/models/episode_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<void> cacheEpisodes(EpisodeResponseModel episodes);
  Future<EpisodeResponseModel?> getCachedEpisodes();
  Future<void> cacheEpisodeDetail(EpisodeModel episode);
  Future<EpisodeModel?> getCachedEpisodeDetail(int id);
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences _prefs;

  LocalDataSourceImpl(this._prefs);

  @override
  Future<void> cacheEpisodes(EpisodeResponseModel episodes) async {
    await _prefs.setString('CACHED_EPISODES', json.encode(episodes.toJson()));
  }

  @override
  Future<EpisodeResponseModel?> getCachedEpisodes() async {
    final jsonString = _prefs.getString('CACHED_EPISODES');
    if (jsonString != null) {
      return EpisodeResponseModel.fromJson(json.decode(jsonString));
    }
    return null;
  }

  @override
  Future<void> cacheEpisodeDetail(EpisodeModel episode) async {
    await _prefs.setString('EPISODE_${episode.id}', json.encode(episode.toJson()));
  }

  @override
  Future<EpisodeModel?> getCachedEpisodeDetail(int id) async {
    final jsonString = _prefs.getString('EPISODE_$id');
    if (jsonString != null) {
      return EpisodeModel.fromJson(json.decode(jsonString));
    }
    return null;
  }
}
