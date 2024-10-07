// presentation/bloc/episode_detail_state.dart
import 'package:equatable/equatable.dart';
import 'package:rickandmorty/features/screen_episode/domain/entites/episode_entity.dart';
import 'package:rickandmorty/features/home/domain/entities/character.dart';

abstract class EpisodeDetailState extends Equatable {
  const EpisodeDetailState();

  @override
  List<Object?> get props => [];
}

class EpisodeDetailInitial extends EpisodeDetailState {}

class EpisodeDetailLoading extends EpisodeDetailState {}

class EpisodeDetailLoaded extends EpisodeDetailState {
  final EpisodeEntity episode;
  final List<CharacterEntity> characters;

  const EpisodeDetailLoaded({
    required this.episode,
    required this.characters,
  });

  @override
  List<Object?> get props => [episode, characters];
}

class EpisodeDetailError extends EpisodeDetailState {
  final String message;

  const EpisodeDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
