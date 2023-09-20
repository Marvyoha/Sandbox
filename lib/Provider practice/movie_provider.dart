import 'dart:math';

import 'package:flutter/material.dart';

import 'movie_model.dart';

final List<Movie> initialData = List.generate(
    40,
    (index) => Movie(
        name: 'Movie ${index + 1}',
        duration: '${Random().nextInt(60) + 50} minutes'));

class MovieProvider extends ChangeNotifier {
  final List<Movie> _movie = initialData;
  List<Movie> get movie => _movie;

  final List<Movie> _favourites = [];
  List<Movie> get favourites => _favourites;

  void addtolist(Movie movie) {
    _favourites.add(movie);
    notifyListeners();
  }

  void removefromlist(Movie movie) {
    _favourites.remove(movie);
    notifyListeners();
  }
}
