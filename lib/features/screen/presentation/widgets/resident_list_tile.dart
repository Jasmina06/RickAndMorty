// widgets/resident_list_tile.dart
import 'package:flutter/material.dart';

class ResidentListTile extends StatelessWidget {
  final String residentId;

  const ResidentListTile({Key? key, required this.residentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xFF5C6BC0),
        child: Text(
          residentId,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      title: Text('Resident ID: $residentId'),
      onTap: () {
        // Логика при нажатии на резидента (например, показать детали)
      },
    );
  }
}
