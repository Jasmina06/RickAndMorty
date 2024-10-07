// presentation/bloc/episode_detail_event.dart

import 'package:equatable/equatable.dart';

abstract class EpisodeDetailEvent extends Equatable {
  const EpisodeDetailEvent();

  @override
  List<Object?> get props => [];
}

class FetchEpisodeDetailEvent extends EpisodeDetailEvent {
  final int episodeId;

  const FetchEpisodeDetailEvent(this.episodeId);

  @override
  List<Object?> get props => [episodeId];
}
