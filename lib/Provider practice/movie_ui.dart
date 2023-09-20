// This line is used to ignore the linting rule that disallows leading underscores for local identifiers
// ignore_for_file: no_leading_underscores_for_local_identifiers

// Importing necessary packages
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:sand_box/Provider%20practice/movie_model.dart';
// Importing the movie provider
import 'movie_provider.dart';

// This is the main widget for the movie screen
class MovieScreen extends StatefulWidget {
  // Constructor for the MovieScreen widget
  const MovieScreen({super.key});

  // Creating the state for the MovieScreen widget
  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

// This is the state for the MovieScreen widget
class _MovieScreenState extends State<MovieScreen> {
  // This is the build method for the widget
  @override
  Widget build(BuildContext context) {
    // Fetching the movies and favourites from the MovieProvider
    var _movies = context.watch<MovieProvider>().movie;
    var _favourites = context.watch<MovieProvider>().favourites;

    // Returning the scaffold which is the main structure of the app
    return Scaffold(
      // Setting the app bar with a title
      appBar: AppBar(
        title: const Text('Provider practice'),
        centerTitle: true,
      ),
      // Setting the body of the scaffold
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // This is a container widget with a row of heart icon and a text widget
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Secondpage())),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                height: 70,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Ionicons.heart),
                    const SizedBox(width: 20),
                    Text(
                      'Go to my list (${_favourites.length})',
                      style: const TextStyle(fontSize: 23),
                    )
                  ],
                ),
              ),
            ),
            // This is a list view builder that builds a list of movie cards
            Expanded(
              child: ListView.builder(
                itemCount: _movies.length,
                itemBuilder: (BuildContext context, int index) {
                  final currentmovie = _movies[index];

                  // This is a card widget for each movie
                  return Card(
                    color: Colors.blue,
                    key: ValueKey(currentmovie.name),
                    child: ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Displaying the movie name and duration
                          Text(currentmovie.name,
                              style: const TextStyle(fontSize: 18)),
                          Text('${currentmovie.duration}',
                              style: const TextStyle(fontSize: 18)),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          if (!_favourites.contains(currentmovie)) {
                            context
                                .read<MovieProvider>()
                                .addtolist(currentmovie);
                          } else {
                            context
                                .read<MovieProvider>()
                                .removefromlist(currentmovie);
                          }
                        },
                        icon: Icon(
                          // The heart icon changes color based on whether the movie is in the favourites list
                          Ionicons.heart,
                          color: _favourites.contains(currentmovie)
                              ? Colors.red
                              : Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Secondpage extends StatefulWidget {
  const Secondpage({Key? key}) : super(key: key);

  @override
  _SecondpageState createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  @override
  Widget build(BuildContext context) {
    var _favourites = context.watch<MovieProvider>().favourites;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Ionicons.heart),
            const SizedBox(width: 20),
            Text(
              'Go to my list ${_favourites.length}',
              style: const TextStyle(fontSize: 23),
            )
          ],
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Expanded(
          child: ListView.builder(
            itemCount: _favourites.length,
            itemBuilder: (BuildContext context, int index) {
              final favourites = _favourites[index];

              // This is a card widget for each movie
              return Card(
                key: ValueKey(favourites.name),
                child: ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Displaying the movie name and duration
                      Text(favourites.name,
                          style: const TextStyle(fontSize: 18)),
                      Text('${favourites.duration}',
                          style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                  trailing: TextButton(
                      onPressed: () {
                        context
                            .read<MovieProvider>()
                            .removefromlist(favourites);
                      },
                      child: const Text(
                        'Remove',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      )),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
