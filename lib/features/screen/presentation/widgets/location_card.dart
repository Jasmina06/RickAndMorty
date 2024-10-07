import 'package:flutter/material.dart';
import 'package:rickandmorty/features/screen/data/models/location_model.dart';

class LocationCard extends StatelessWidget {
  final LocationModel location;
  final VoidCallback onTap; 

  const LocationCard({
    Key? key,
    required this.location,
    required this.onTap, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: ListTile(
        leading: const Icon(
          Icons.location_on,
          color: Colors.blueAccent,
          size: 30,
        ),
        title: Text(
          location.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              'Type: ${location.type}',
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            Text(
              'Dimension: ${location.dimension}',
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
        onTap: onTap, 
      ),
    );
  }
}
