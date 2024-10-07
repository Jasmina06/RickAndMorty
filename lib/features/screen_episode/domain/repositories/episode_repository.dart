// episode_repository.dart
import 'package:dartz/dartz.dart';
import 'package:rickandmorty/core/error/failures.dart';
import 'package:rickandmorty/features/screen_episode/domain/entites/episode_entity.dart';

abstract class EpisodeRepository {
  Future<Either<Failure, List<EpisodeEntity>>> getEpisodes(int page); 
  Future<Either<Failure, EpisodeEntity>> getEpisodeDetail(int id); 
}
