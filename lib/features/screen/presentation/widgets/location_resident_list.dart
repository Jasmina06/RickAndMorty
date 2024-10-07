// widgets/location_residents_list.dart
import 'package:flutter/material.dart';
import 'package:rickandmorty/features/screen/presentation/widgets/resident_list_tile.dart';


class LocationResidentsList extends StatelessWidget {
  final List<String> residents;

  const LocationResidentsList({Key? key, required this.residents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '                        Residents:',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF5C6BC0)),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: residents.length,
          itemBuilder: (context, index) {
            final residentUrl = residents[index];
            final residentId = residentUrl.split('/').last;
            return ResidentListTile(residentId: residentId);
          },
        ),
      ],
    );
  }
}
