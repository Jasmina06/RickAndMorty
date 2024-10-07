import 'package:dartz/dartz.dart';
import 'package:rickandmorty/core/error/exeption.dart';
import 'package:rickandmorty/core/error/failures.dart';
import 'package:rickandmorty/features/screen_episode/data/datasource/episode_remote_datasource.dart';
import 'package:rickandmorty/features/screen_episode/domain/entites/episode_entity.dart';
import 'package:rickandmorty/features/screen_episode/domain/repositories/episode_repository.dart';
import 'dart:developer';

class EpisodeRepositoryImpl implements EpisodeRepository {
  final IEpisodeRemoteDataSource remoteDataSource;

  EpisodeRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<EpisodeEntity>>> getEpisodes(int page) async {
    try {
      // Получаем список эпизодов с удаленного API
      final episodeResponse = await remoteDataSource.fetchEpisodes(page);

      final episodeEntities = episodeResponse.results.map((episode) {
        return EpisodeEntity(
          id: episode.id,
          name: episode.name,
          airDate: episode.airDate,
          episode: episode.episode,
          characters: episode.characters,
          url: episode.url,
          created: episode.created,
        );
      }).toList();

      return Right(episodeEntities);
    } on ServerException {
      log('ServerException: Failed to fetch episodes');
      return Left(ServerFailure());
    } catch (e) {
      log('Unexpected error in getEpisodes: $e');
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, EpisodeEntity>> getEpisodeDetail(int id) async {
    try {
      final episodeDetail = await remoteDataSource.fetchEpisodeDetail(id);

      
      final episodeEntity = EpisodeEntity(
        id: episodeDetail.id,
        name: episodeDetail.name,
        airDate: episodeDetail.airDate,
        episode: episodeDetail.episode,
        characters: episodeDetail.characters,
        url: episodeDetail.url,
        created: episodeDetail.created,
      );

      log('Successfully fetched episode detail for ID: $id');
      return Right(episodeEntity);
    } on ServerException {
      log('ServerException: Failed to fetch episode detail for ID: $id');
      return Left(ServerFailure());
    } catch (e) {
      log('Unexpected error in getEpisodeDetail: $e');
      return Left(UnexpectedFailure());
    }
  }
}
