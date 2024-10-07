import 'package:flutter/material.dart';
import 'package:rickandmorty/features/screen_episode/domain/entites/episode_entity.dart';
import 'episode_card.dart';

class EpisodeList extends StatelessWidget {
  final List<EpisodeEntity> episodes;
  final ScrollController scrollController;

  const EpisodeList({
    Key? key,
    required this.episodes,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: episodes.length,
      itemBuilder: (context, index) {
        final episode = episodes[index];
        return EpisodeCard(
          episode: episode, 
        );
      },
    );
  }
}
