// presentation/pages/episode_detail_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/features/screen_episode/presentation/bloc/episode_detail_bloc.dart';
import 'package:rickandmorty/features/screen_episode/presentation/bloc/episode_detail_event.dart';
import 'package:rickandmorty/features/screen_episode/presentation/bloc/episode_detail_state.dart';
import 'package:rickandmorty/core/service_locator/service_locator.dart';

class EpisodeDetailPage extends StatelessWidget {
  final int episodeId;

  const EpisodeDetailPage({
    Key? key,
    required this.episodeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Episode Detail',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: const Color(0xFF5C6BC0),
      ),
      body: BlocProvider(
        create: (context) => EpisodeDetailBloc(
          getEpisodeDetailUseCase: sl(),
          getCharacterDetailUseCase: sl(),
        )..add(FetchEpisodeDetailEvent(episodeId)),
        child: BlocBuilder<EpisodeDetailBloc, EpisodeDetailState>(
          builder: (context, state) {
            if (state is EpisodeDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is EpisodeDetailLoaded) {
              final episode = state.episode;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      episode.name,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text('Air date: ${episode.airDate}'),
                    const SizedBox(height: 16),
                    const Text('Characters:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    if (state.characters.isNotEmpty) ...[
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.characters.length,
                        itemBuilder: (context, index) {
                          final character = state.characters[index];
                          return ListTile(
                            title: Text(character.name),
                            subtitle: Text('Status: ${character.status}'),
                          );
                        },
                      ),
                    ] else ...[
                      const Center(child: Text('No characters available.')),
                    ],
                  ],
                ),
              );
            } else if (state is EpisodeDetailError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('No episode details available'));
            }
          },
        ),
      ),
    );
  }
}
