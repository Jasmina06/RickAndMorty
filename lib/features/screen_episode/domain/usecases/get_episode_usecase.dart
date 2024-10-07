// get_episodes_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:rickandmorty/core/error/failures.dart';
import 'package:rickandmorty/features/screen_episode/domain/entites/episode_entity.dart';
import 'package:rickandmorty/features/screen_episode/domain/repositories/episode_repository.dart';

class GetEpisodesUseCase {
  final EpisodeRepository repository;

  GetEpisodesUseCase(this.repository);

  Future<Either<Failure, List<EpisodeEntity>>> call({int page = 1}) async {
    return await repository.getEpisodes(page);
  }
}
