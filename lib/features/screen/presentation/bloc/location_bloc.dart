import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/error/failures.dart';
import 'package:rickandmorty/features/screen/data/models/location_model.dart';
import 'package:rickandmorty/features/screen/domain/usecases/get_location_usecase.dart';
import 'location_event.dart';
import 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetLocationsUseCase getLocationsUseCase;

  LocationBloc({required this.getLocationsUseCase}) : super(LocationInitial()) {
    on<FetchLocationsEvent>(_onFetchLocations);
  }

  void _onFetchLocations(
    FetchLocationsEvent event,
    Emitter<LocationState> emit,
  ) async {
    if (state is LocationLoading) return;

    final currentState = state;
    List<LocationModel> locations = []; // Используйте список LocationModel
    if (currentState is LocationLoaded) {
      locations = currentState.locations;
    }

    emit(LocationLoading());

    final failureOrLocations = await getLocationsUseCase(Params(page: event.page));

    emit(
      failureOrLocations.fold(
        (failure) => LocationError(_mapFailureToMessage(failure)),
        (locationData) {
          // Преобразуйте LocationEntity в LocationModel перед отправкой в состояние
          final locationModels = locationData.results.map((locationEntity) {
            return LocationModel(
              id: locationEntity.id,
              name: locationEntity.name,
              type: locationEntity.type,
              dimension: locationEntity.dimension,
              residents: locationEntity.residents,
              url: locationEntity.url,
              created: locationEntity.created,
            );
          }).toList();

          return LocationLoaded(
            locations: [...locations, ...locationModels], // Используйте LocationModel
            hasReachedMax: locationData.info.next == null,
          );
        },
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return 'Failed to connect to the server.';
    } else if (failure is CacheFailure) {
      return 'Failed to load data from cache.';
    } else {
      return 'Unexpected error.';
    }
  }
}
