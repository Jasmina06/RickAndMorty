// presentation/bloc/character_detail_state.dart
import 'package:equatable/equatable.dart';
import 'package:rickandmorty/features/home/domain/entities/character.dart'; // Импортируем сущность CharacterEntity

abstract class CharacterDetailState extends Equatable {
  const CharacterDetailState();

  @override
  List<Object?> get props => [];
}

class CharacterDetailInitial extends CharacterDetailState {}

class CharacterDetailLoading extends CharacterDetailState {}

class CharacterDetailLoaded extends CharacterDetailState {
  final CharacterEntity character; // Используем CharacterEntity

  const CharacterDetailLoaded({required this.character}); // Именованный параметр character

  @override
  List<Object?> get props => [character];
}

class CharacterDetailError extends CharacterDetailState {
  final String message;

  const CharacterDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
