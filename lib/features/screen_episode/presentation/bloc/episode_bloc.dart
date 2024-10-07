import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/error/failures.dart';
import 'package:rickandmorty/features/screen_episode/domain/repositories/episode_repository.dart';
import 'package:rickandmorty/features/screen_episode/presentation/bloc/episode_event.dart';
import 'package:rickandmorty/features/screen_episode/presentation/bloc/episode_state.dart';
import 'dart:developer';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final EpisodeRepository episodeRepository;

  EpisodeBloc({required this.episodeRepository}) : super(EpisodeInitial()) {
    on<FetchEpisodesEvent>(_onFetchEpisodes);
  }

  Future<void> _onFetchEpisodes(
    FetchEpisodesEvent event,
    Emitter<EpisodeState> emit,
  ) async {
    emit(EpisodeLoading());
    log('Loading episodes for page: ${event.page}');

    final failureOrEpisodes = await episodeRepository.getEpisodes(event.page);

    failureOrEpisodes.fold(
      (failure) {
        log('Error loading episodes: ${_mapFailureToMessage(failure)}');
        emit(EpisodeError(errorMessage: _mapFailureToMessage(failure)));
      },
      (episodes) {
        log('Successfully loaded ${episodes.length} episodes for page: ${event.page}');
        emit(EpisodeLoaded(episodes: episodes, hasReachedMax: false));
      },
    );
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
