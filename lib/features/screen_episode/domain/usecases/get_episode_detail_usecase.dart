// domain/usecases/get_episode_detail_usecase.dart

import 'package:dartz/dartz.dart';
import 'package:rickandmorty/core/error/failures.dart';
import 'package:rickandmorty/features/screen_episode/domain/entites/episode_entity.dart';
import 'package:rickandmorty/features/screen_episode/domain/repositories/episode_repository.dart';

class GetEpisodeDetailUseCase {
  final EpisodeRepository repository;

  GetEpisodeDetailUseCase(this.repository);

  Future<Either<Failure, EpisodeEntity>> call(int episodeId) async {
    return await repository.getEpisodeDetail(episodeId);
  }
}
