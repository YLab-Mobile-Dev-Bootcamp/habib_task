part of 'anime_bloc.dart';

@immutable
abstract class AnimeState {}

class AnimeInitial extends AnimeState {}

class AnimeSuccess extends AnimeState {
  final AnimeDto animeDto;
  AnimeSuccess(this.animeDto);
  @override
  List<Object> get props => [this.animeDto];
}

class AnimeLoading extends AnimeState {
  AnimeLoading();
  @override
  List<Object> get props => [];
}

class AnimeError extends AnimeState {
  AnimeError();
  @override
  List<Object> get props => [];
}
