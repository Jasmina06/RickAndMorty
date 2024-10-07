import 'package:equatable/equatable.dart';

abstract class CharacterDetailEvent extends Equatable {
  const CharacterDetailEvent();

  @override
  List<Object?> get props => [];
}

class FetchCharacterDetailEvent extends CharacterDetailEvent {
  final int id;

  const FetchCharacterDetailEvent(this.id);

  @override
  List<Object?> get props => [id];
}
