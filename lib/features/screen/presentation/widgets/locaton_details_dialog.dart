import 'package:flutter/material.dart';
import 'package:rickandmorty/features/screen/data/models/location_model.dart';

class LocationDetailDialog extends StatelessWidget {
  final LocationModel location;

  const LocationDetailDialog({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(location.name),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Type: ${location.type}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Dimension: ${location.dimension}'),
            const SizedBox(height: 10),
            Text('Residents:', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ...location.residents.map((residentUrl) {
              return Text('- Resident ID: ${residentUrl.split('/').last}');
            }).toList(),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
