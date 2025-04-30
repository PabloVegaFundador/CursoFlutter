import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieInfoProvider = 
StateNotifierProvider.autoDispose<MovieMapNotifier, Map<String, Movie>>((ref){
  final movieRepository = ref.watch(movieRepositoryProvider);

  return MovieMapNotifier(
    getMovie: (movieId) => movieRepository.getMovieById(id: movieId)
    );

});

typedef GetMovieCallback = Future<Movie>Function(String movieId);


class MovieMapNotifier extends StateNotifier<Map<String, Movie>>{
  
  final GetMovieCallback getMovie;

  MovieMapNotifier({ required this.getMovie}) :super({});

  Future<void> loadMovie(String movieId) async{
    if(state[movieId] != null) return;
    print ('Realizando petición http');
    final movie = await getMovie(movieId);

    state = {...state, movieId: movie};
}
}