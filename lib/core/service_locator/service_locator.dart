// lib/service_locator.dart

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/features/home/data/datasources/character_local_datasource.dart';
import 'package:rickandmorty/features/home/data/datasources/character_remote_datasource.dart';
import 'package:rickandmorty/features/home/data/repositories/character_repository.dart';
import 'package:rickandmorty/features/home/domain/repositories/character_repository.dart';
import 'package:rickandmorty/features/home/domain/usecases/get_character_detail_usecase.dart';
import 'package:rickandmorty/features/home/domain/usecases/get_characters_usecase.dart';
import 'package:rickandmorty/features/home/presentation/bloc/character_bloc.dart';
import 'package:rickandmorty/features/screen/data/datasources/location_remote_datasource.dart';
import 'package:rickandmorty/features/screen/data/repositories/location_repository.dart';
import 'package:rickandmorty/features/screen/domain/repositories/location_repository.dart';
import 'package:rickandmorty/features/screen/domain/usecases/get_location_usecase.dart';
import 'package:rickandmorty/features/screen/presentation/bloc/location_bloc.dart';
import 'package:rickandmorty/features/screen_episode/data/datasource/episode_remote_datasource.dart';
import 'package:rickandmorty/features/screen_episode/data/repositories/episode_repository.dart';
import 'package:rickandmorty/features/screen_episode/domain/repositories/episode_repository.dart';
import 'package:rickandmorty/features/screen_episode/domain/usecases/get_episode_detail_usecase.dart';
import 'package:rickandmorty/features/screen_episode/domain/usecases/get_episode_usecase.dart';
import 'package:rickandmorty/features/screen_episode/presentation/bloc/episode_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Регистрация внешних зависимостей
  sl.registerLazySingleton<http.Client>(() => http.Client());

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // Регистрация удаленных источников данных (Remote Data Sources)
  sl.registerLazySingleton<CharacterRemoteDataSource>(
      () => CharacterRemoteDataSourceImpl(client: sl<http.Client>()));
  sl.registerLazySingleton<LocationRemoteDataSource>(
      () => LocationRemoteDataSourceImpl(client: sl<http.Client>()));
  sl.registerLazySingleton<IEpisodeRemoteDataSource>(
      () => EpisodeRemoteDataSourceImpl(client: sl<http.Client>()));

  // Регистрация локальных источников данных (Local Data Sources)
  sl.registerLazySingleton<CharacterLocalDataSource>(
      () => CharacterLocalDataSourceImpl(sharedPreferences: sl<SharedPreferences>()));

  // Регистрация репозиториев
  sl.registerLazySingleton<CharacterRepository>(() => CharacterRepositoryImpl(
        remoteDataSource: sl<CharacterRemoteDataSource>(),
        localDataSource: sl<CharacterLocalDataSource>(),
      ));
  sl.registerLazySingleton<LocationRepository>(() => LocationRepositoryImpl(
        remoteDataSource: sl<LocationRemoteDataSource>(),
      ));
  sl.registerLazySingleton<EpisodeRepository>(() => EpisodeRepositoryImpl(
        remoteDataSource: sl<IEpisodeRemoteDataSource>(),
      ));

  // Регистрация Use Cases
  sl.registerLazySingleton(() => GetCharactersUseCase(sl<CharacterRepository>()));
  sl.registerLazySingleton(() => GetCharacterDetailUseCase(sl<CharacterRepository>()));
  sl.registerLazySingleton(() => GetLocationsUseCase(sl<LocationRepository>()));
  sl.registerLazySingleton(() => GetEpisodesUseCase(sl<EpisodeRepository>()));
  sl.registerLazySingleton(() => GetEpisodeDetailUseCase(sl<EpisodeRepository>()));

  // Регистрация Bloc'ов
  sl.registerFactory(() => CharacterBloc(
        getCharactersUseCase: sl<GetCharactersUseCase>(),
        getCharacterDetailUseCase: sl<GetCharacterDetailUseCase>(),
      ));
  sl.registerFactory(() => LocationBloc(getLocationsUseCase: sl<GetLocationsUseCase>()));
  sl.registerFactory(() => EpisodeBloc(episodeRepository: sl<EpisodeRepository>()));
}
