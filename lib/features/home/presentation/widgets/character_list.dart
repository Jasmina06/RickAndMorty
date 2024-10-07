import 'package:flutter/material.dart';
import 'package:rickandmorty/features/home/domain/entities/character.dart';
import 'package:rickandmorty/features/home/presentation/widgets/character_tile.dart';

class CharacterList extends StatefulWidget {
  final List<CharacterEntity> characters; 
  final void Function(String) onStatusChanged; 

  const CharacterList({
    Key? key,
    required this.characters,
    required this.onStatusChanged,
  }) : super(key: key);

  @override
  _CharacterListState createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Виджет Dropdown для изменения статуса
        DropdownButton<String>(
          value: 'All',
          items: ['All', 'Alive', 'Dead', 'Unknown'].map((String status) {
            return DropdownMenuItem<String>(
              value: status,
              child: Text(status),
            );
          }).toList(),
          onChanged: (newStatus) {
            widget.onStatusChanged(newStatus!);
          },
        ),
        // Список персонажей
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: widget.characters.length,
            itemBuilder: (context, index) {
              final character = widget.characters[index];
              return CharacterTile(
                character: character, 
              );
            },
          ),
        ),
      ],
    );
  }

  void _onScroll() {
    if (_isBottom) {
      print('Reached bottom, load more characters if necessary...');
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
