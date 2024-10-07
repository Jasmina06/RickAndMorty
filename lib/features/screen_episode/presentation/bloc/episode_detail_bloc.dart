// presentation/bloc/episode_detail_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/error/failures.dart';
import 'package:rickandmorty/features/home/domain/entities/character.dart';
import 'package:rickandmorty/features/home/domain/usecases/get_character_detail_usecase.dart';
import 'package:rickandmorty/features/screen_episode/domain/usecases/get_episode_detail_usecase.dart';
import 'package:rickandmorty/features/screen_episode/presentation/bloc/episode_detail_event.dart';
import 'package:rickandmorty/features/screen_episode/presentation/bloc/episode_detail_state.dart';
import 'dart:developer';

class EpisodeDetailBloc extends Bloc<EpisodeDetailEvent, EpisodeDetailState> {
  final GetEpisodeDetailUseCase getEpisodeDetailUseCase;
  final GetCharacterDetailUseCase getCharacterDetailUseCase;

  EpisodeDetailBloc({
    required this.getEpisodeDetailUseCase,
    required this.getCharacterDetailUseCase,
  }) : super(EpisodeDetailInitial()) {
    on<FetchEpisodeDetailEvent>(_onFetchEpisodeDetail);
  }

  Future<void> _onFetchEpisodeDetail(
    FetchEpisodeDetailEvent event,
    Emitter<EpisodeDetailState> emit,
  ) async {
    emit(EpisodeDetailLoading());
    log('Loading episode detail for episode ID: ${event.episodeId}');

    try {
      final failureOrEpisode = await getEpisodeDetailUseCase(event.episodeId);

      // Check if Bloc has been closed before proceeding (remove if unnecessary)
      if (emit.isDone) return;

      await failureOrEpisode.fold(
        (failure) async {
          log('Error loading episode detail: ${_mapFailureToMessage(failure)}');
          emit(EpisodeDetailError(_mapFailureToMessage(failure)));
        },
        (episode) async {
          log('Episode details loaded. Now loading characters...');
          final characterIds = episode.characters
              .map((characterUrl) => int.tryParse(characterUrl.split('/').last) ?? 0)
              .where((id) => id != 0)
              .toList();
          log('Character IDs: $characterIds');

          final characterResults = await Future.wait(
            characterIds.map((id) async => await getCharacterDetailUseCase(id)),
          );

          final characters = characterResults
              .where((result) => result.isRight()) // Only include successful results
              .map((result) => result.fold((_) => null, (character) => character))
              .whereType<CharacterEntity>()
              .toList();

          if (!emit.isDone) {
            log('Successfully loaded ${characters.length} characters for episode ID: ${event.episodeId}');
            emit(EpisodeDetailLoaded(episode: episode, characters: characters));
          }
        },
      );
    } catch (e) {
      log('Error in EpisodeDetailBloc: $e');
      if (!emit.isDone) emit(EpisodeDetailError('Unexpected error: $e'));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case CacheFailure:
        return 'Cache Failure';
      default:
        return 'Unexpected Error';
    }
  }
}
