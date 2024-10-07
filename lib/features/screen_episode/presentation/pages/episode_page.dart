// presentation/pages/episode_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/features/screen_episode/presentation/bloc/episode_bloc.dart';
import 'package:rickandmorty/features/screen_episode/presentation/bloc/episode_event.dart';
import 'package:rickandmorty/features/screen_episode/presentation/bloc/episode_state.dart';
import 'package:rickandmorty/features/screen_episode/presentation/widgets/episode_list.dart';
import 'dart:developer';
import 'package:rickandmorty/core/service_locator/service_locator.dart';

class EpisodePage extends StatelessWidget {
  const EpisodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<EpisodeBloc>()..add(const FetchEpisodesEvent(page: 1)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Episodes',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          backgroundColor: const Color(0xFF5C6BC0),
        ),
        body: BlocBuilder<EpisodeBloc, EpisodeState>(
          builder: (context, state) {
            if (state is EpisodeLoading) {
              log('Loading state in UI');
              return const Center(child: CircularProgressIndicator());
            } else if (state is EpisodeLoaded) {
              log('Loaded state in UI with ${state.episodes.length} episodes');
              return EpisodeList(
                episodes: state.episodes,
                scrollController: ScrollController(),
              );
            } else if (state is EpisodeError) {
              log('Error state in UI: ${state.errorMessage}');
              return Center(child: Text('Error: ${state.errorMessage}'));
            } else {
              return const Center(child: Text('No episodes available'));
            }
          },
        ),
      ),
    );
  }
}
