import 'package:flutter/material.dart';
import 'package:rickandmorty/features/home/domain/entities/character.dart';
import 'package:rickandmorty/features/home/presentation/pages/character_detail_page.dart';

class CharacterTile extends StatelessWidget {
  final CharacterEntity character;

  const CharacterTile({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10.0),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(character.image),
          radius: 30,
        ),
        title: Text(
          character.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(
          'Status: ${character.status} | Species: ${character.species}',
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CharacterDetailPage(characterId: character.id),
            ),
          );
        },
      ),
    );
  }
}
