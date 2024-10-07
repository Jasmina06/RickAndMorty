import 'package:flutter/material.dart';
import 'package:rickandmorty/features/screen/data/models/location_model.dart';
import 'location_card.dart';

class LocationList extends StatelessWidget {
  final List<LocationModel> locations;
  final ScrollController scrollController;
  final bool isLoadingMore;
  final VoidCallback fetchMore;
  final Function(BuildContext, LocationModel) showLocationDetails;

  const LocationList({
    Key? key,
    required this.locations,
    required this.scrollController,
    required this.isLoadingMore,
    required this.fetchMore,
    required this.showLocationDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(10.0),
      itemCount: locations.length + (isLoadingMore ? 1: 0),
      itemBuilder: (context, index) {
        if (index < locations.length) {
          return LocationCard(
            location: locations[index],
            onTap: () => showLocationDetails(context, locations[index]), // Используем onTap
          );
        } else {
          // Если идет подгрузка, показываем индикатор загрузки
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
