import 'package:flutter/material.dart';
import 'package:rickandmorty/features/home/domain/entities/character.dart';

class CharacterInfoCard extends StatelessWidget {
  final CharacterEntity character;

  const CharacterInfoCard({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8), 
      child: Padding(
        padding: const EdgeInsets.all(35.0), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              character.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5C6BC0), 
              ),
            ),
            const Divider(
              color: Color(0xFF5C6BC0),
              thickness: 2,
            ),
            const SizedBox(height: 10),
            _buildInfoRow('Status', character.status),
            const SizedBox(height: 10),
            _buildInfoRow('Species', character.species),
            const SizedBox(height: 10),
            _buildInfoRow('Gender', character.gender),
            const SizedBox(height:10),
            _buildInfoRow('Origin', character.origin),
            const SizedBox(height: 10),
            _buildInfoRow('Location', character.location),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String info) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$title: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          TextSpan(
            text: info,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
