import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import '../models/animeDto.dart';
import 'package:meta/meta.dart';

part 'anime_event.dart';
part 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  AnimeBloc();

  @override
  AnimeState get initialState => AnimeInitial();

  @override
  Stream<AnimeState> mapEventToState(
    AnimeEvent event,
  ) async* {
    if (event is GetAnime) {
      yield AnimeLoading();
      try {
        Dio _dio = Dio();
        Response response = await _dio.get("https://api.aniapi.com/v1/anime");
        AnimeDto animeDto = AnimeDto.fromJson(response.data);
        yield AnimeSuccess(animeDto);
      } catch (e) {
        yield AnimeError();
      }
    }
  }
}
