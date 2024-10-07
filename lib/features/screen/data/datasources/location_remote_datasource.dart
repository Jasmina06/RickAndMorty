import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/core/error/exeption.dart';
import 'package:rickandmorty/features/screen/data/models/location_model.dart';

abstract class LocationRemoteDataSource {
  Future<RickAndMortyResponseModel> fetchLocations({int page});
}

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final http.Client client;

  LocationRemoteDataSourceImpl({required this.client});

  @override
  Future<RickAndMortyResponseModel> fetchLocations({int page = 1}) async {
    final response = await client.get(Uri.parse('https://rickandmortyapi.com/api/location?page=$page'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return RickAndMortyResponseModel.fromJson(json);
    } else {
      throw ServerException();
    }
  }
}
