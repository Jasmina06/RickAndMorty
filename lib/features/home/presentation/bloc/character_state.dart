import 'package:equatable/equatable.dart';
import 'package:rickandmorty/features/home/domain/entities/character.dart';


abstract class CharacterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {
  final List<CharacterEntity> characters;
  final String selectedStatus;
  final bool isMoreLoading;

  CharacterLoading({
    required this.characters,
    required this.selectedStatus,
    this.isMoreLoading = false,
  });

  @override
  List<Object?> get props => [characters, selectedStatus, isMoreLoading];
}

class CharacterLoaded extends CharacterState {
  final List<CharacterEntity> characters;
  final bool hasReachedMax;
  final String selectedStatus;

  CharacterLoaded({
    required this.characters,
    required this.hasReachedMax,
    required this.selectedStatus,
  });

  @override
  List<Object?> get props => [characters, hasReachedMax, selectedStatus];
}

class CharacterError extends CharacterState {
  final String message;

  CharacterError(this.message);

  @override
  List<Object?> get props => [message];
}
