part of 'anime_bloc.dart';

@immutable
abstract class AnimeEvent {}

class GetAnime extends AnimeEvent {
  GetAnime();
  @override
  List<Object> get props => [];
}
