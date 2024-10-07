// presentation/pages/location_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/features/screen/presentation/bloc/location_bloc.dart';
import 'package:rickandmorty/features/screen/presentation/bloc/location_event.dart';
import 'package:rickandmorty/features/screen/presentation/bloc/location_state.dart';
import 'package:rickandmorty/features/screen/presentation/pages/location_detail_page.dart';
import 'package:rickandmorty/features/screen/presentation/widgets/location_list.dart';
import 'package:rickandmorty/core/service_locator/service_locator.dart'; 

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LocationBloc>()..add(const FetchLocationsEvent(page: 1)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Locations',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          backgroundColor: const Color(0xFF5C6BC0),
        ),
        body: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, state) {
            if (state is LocationLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LocationLoaded) {
              return LocationList(
                locations: state.locations,
                scrollController: ScrollController(),
                isLoadingMore: false,
                fetchMore: () {
                  // Загрузка новых локаций при прокрутке вниз
                  context.read<LocationBloc>().add(FetchLocationsEvent(page: state.locations.length ~/ 20 + 1));
                },
                showLocationDetails: (context, location) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LocationDetailPage(location: location),
                    ),
                  );
                },
              );
            } else if (state is LocationError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('No Locations Found'));
            }
          },
        ),
      ),
    );
  }
}
