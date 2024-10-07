import 'package:equatable/equatable.dart';
import 'package:rickandmorty/features/home/domain/entities/character.dart';

class EpisodeEntity extends Equatable {
  final int id;
  final String name;
  final String? airDate;
  final String episode;
  final List<String> characters; 
  final List<CharacterEntity>? characterDetails; 
  final String url;
  final DateTime created;

  const EpisodeEntity({
    required this.id,
    required this.name,
    this.airDate,
    required this.episode,
    required this.characters,
    this.characterDetails, 
    required this.url,
    required this.created,
  });

  @override
  List<Object?> get props => [id, name, airDate, episode, characters, characterDetails, url, created];
}
