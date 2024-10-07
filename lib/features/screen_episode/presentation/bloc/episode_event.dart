import 'package:equatable/equatable.dart';

abstract class EpisodeEvent extends Equatable {
  const EpisodeEvent();

  @override
  List<Object> get props => [];
}

class FetchEpisodesEvent extends EpisodeEvent {
  final int page;

  const FetchEpisodesEvent({required this.page});

  @override
  List<Object> get props => [page];
}
