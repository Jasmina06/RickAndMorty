// presentation/pages/character_detail_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/features/home/presentation/bloc/character_detail_bloc.dart';
import 'package:rickandmorty/features/home/presentation/bloc/character_detail_event.dart';
import 'package:rickandmorty/features/home/presentation/bloc/character_detail_state.dart';
import 'package:rickandmorty/features/home/presentation/widgets/character_image.dart';
import 'package:rickandmorty/features/home/presentation/widgets/character_info_card.dart';
import 'package:rickandmorty/core/service_locator/service_locator.dart'; 

class CharacterDetailPage extends StatelessWidget {
  final int characterId; 

  const CharacterDetailPage({
    Key? key,
    required this.characterId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Character Details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF5C6BC0),
      ),
      body: BlocProvider(
        create: (context) => CharacterDetailBloc(
          getCharacterDetailUseCase: sl(),
        )..add(FetchCharacterDetailEvent(characterId)), 
        child: BlocBuilder<CharacterDetailBloc, CharacterDetailState>(
          builder: (context, state) {
            if (state is CharacterDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CharacterDetailLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CharacterImage(
                        imageUrl: state.character.image, 
                        characterId: state.character.id,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CharacterInfoCard(character: state.character), 
                    ),
                  ],
                ),
              );
            } else if (state is CharacterDetailError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('No Character Found'));
            }
          },
        ),
      ),
    );
  }
}
