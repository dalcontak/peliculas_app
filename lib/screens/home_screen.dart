import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:peliculas_app/search/search_delegate.dart';
import 'package:peliculas_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en cines'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()),
              icon: const Icon( Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper( movies: moviesProvider.onDisplayMovies ),

            MovieSlider(
              movies: moviesProvider.popularMovies, // populars
              title: 'Populares', //optional
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
          ],
        ),
      )
    );
  }
}
