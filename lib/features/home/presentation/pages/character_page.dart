// presentation/pages/character_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/features/home/presentation/bloc/character_bloc.dart';
import 'package:rickandmorty/features/home/presentation/bloc/character_event.dart';
import 'package:rickandmorty/features/home/presentation/bloc/character_state.dart';
import 'package:rickandmorty/features/home/presentation/widgets/character_list.dart';
import 'package:rickandmorty/features/home/presentation/widgets/status_dropdown.dart';
import 'package:rickandmorty/core/service_locator/service_locator.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CharacterBloc>()..add(const FetchCharactersEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Character Page',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          backgroundColor: const Color(0xFF5C6BC0),
          elevation: 4,
          actions: [
            BlocBuilder<CharacterBloc, CharacterState>(
              builder: (context, state) {
                if (state is CharacterLoaded) {
                  return StatusDropdown(
                    selectedStatus: state.selectedStatus,
                    onStatusChanged: (newStatus) {
                      context.read<CharacterBloc>()
                        ..add(ClearCharactersEvent())
                        ..add(FetchCharactersEvent(status: newStatus));
                    },
                  );
                }
                return const SizedBox.shrink(); 
              },
            ),
          ],
        ),
        body: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            if (state is CharacterLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CharacterLoaded) {
              return CharacterList(
                characters: state.characters,
                onStatusChanged: (newStatus) {
                  context.read<CharacterBloc>()
                    ..add(ClearCharactersEvent())
                    ..add(FetchCharactersEvent(status: newStatus));
                },
              );
            } else if (state is CharacterError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('No Characters Found'));
            }
          },
        ),
      ),
    );
  }
}
