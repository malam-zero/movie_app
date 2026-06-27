import 'package:flutter/material.dart';
import 'package:movie_app/components/movie_card.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<MovieProvider>(context, listen: false).loadMovies(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final moviesData = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Movies')),
      body: Center(
        child: ListView.builder(
          itemCount: moviesData.movieList.length,
          itemBuilder: (context, index) {
            final movie = moviesData.movieList[index];
            return MovieCard(movie: movie);
            // _List(movies: moviesData.movieList, index: index);
          },
        ),
      ),
    );
  }
}

// class _List extends StatelessWidget {
//   const _List({required this.movies, required this.index});

//   final List<Movie> movies;
//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     final movie = movies[index];
//     return ListTile(
//       title: Text(movie.title),
//       leading: CircleAvatar(child: Text(movie.title[0])),
//       subtitle: Text('Directed By ${movie.director}'),
//       // trailing: Icon(Icons.movie),
//     );
//     // Card(child: Text(movies[index]));
//   }
// }
