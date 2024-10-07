import 'package:equatable/equatable.dart';
import 'package:rickandmorty/features/screen/data/models/location_model.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object?> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final List<LocationModel> locations; // Используйте LocationModel вместо LocationEntity
  final bool hasReachedMax;

  const LocationLoaded({
    required this.locations,
    this.hasReachedMax = false,
  });

  @override
  List<Object?> get props => [locations, hasReachedMax];
}

class LocationError extends LocationState {
  final String message;

  const LocationError(this.message);

  @override
  List<Object?> get props => [message];
}
