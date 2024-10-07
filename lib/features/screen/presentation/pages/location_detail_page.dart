import 'package:flutter/material.dart';
import 'package:rickandmorty/features/screen/data/models/location_model.dart';
import 'package:rickandmorty/features/screen/presentation/widgets/location_info_row.dart';
import 'package:rickandmorty/features/screen/presentation/widgets/location_resident_list.dart';

class LocationDetailPage extends StatelessWidget {
  final LocationModel location;

  const LocationDetailPage({required this.location, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
        backgroundColor: const Color(0xFF5C6BC0),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              LocationInfoRow(label: 'Type', value: location.type),
              LocationInfoRow(label: 'Dimension', value: location.dimension),
              LocationInfoRow(label: 'Number of Residents', value: location.residents.length.toString()),
              LocationInfoRow(label: 'Created', value: location.created.toLocal().toString()),
              
              const SizedBox(height: 20),
              if (location.residents.isNotEmpty)
                LocationResidentsList(residents: location.residents),
              if (location.residents.isEmpty)
                const Text(
                  'No known residents.',
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.grey),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
