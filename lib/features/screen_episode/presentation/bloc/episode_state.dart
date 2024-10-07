// episode_state.dart
import 'package:equatable/equatable.dart';
import 'package:rickandmorty/features/screen_episode/domain/entites/episode_entity.dart';

abstract class EpisodeState extends Equatable {
  const EpisodeState();

  @override
  List<Object?> get props => [];
}

class EpisodeInitial extends EpisodeState {}

class EpisodeLoading extends EpisodeState {}

class EpisodeLoaded extends EpisodeState {
  final List<EpisodeEntity> episodes;
  final bool hasReachedMax;

  const EpisodeLoaded({
    required this.episodes,
    required this.hasReachedMax,
  });

  @override
  List<Object?> get props => [episodes, hasReachedMax];
}

class EpisodeError extends EpisodeState {
  final String errorMessage; // Поле для хранения сообщения об ошибке

  const EpisodeError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
