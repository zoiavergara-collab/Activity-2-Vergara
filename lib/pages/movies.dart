import 'package:flutter/material.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final List<Map<String, String>> movies = [
    {
      "title": "Anyone But You",
      "genre": "Romance Comedy",
      "rating": "7.0/10",
    },
    {
      "title": "The Proposal",
      "genre": "Romance Comedy",
      "rating": "6.8/10",
    },
    {
      "title": "Crazy Rich Asians",
      "genre": "Romance Comedy",
      "rating": "6.9/10",
    },
    {
      "title": "10 Things I Hate About You",
      "genre": "Romance Comedy",
      "rating": "7.3/10",
    },
    {
      "title": "How to Lose a Guy in 10 Days",
      "genre": "Romance Comedy",
      "rating": "6.4/10",
    },
    {
      "title": "The Holiday",
      "genre": "Romance Comedy",
      "rating": "7.0/10",
    },
    {
      "title": "Love, Rosie",
      "genre": "Romance Comedy",
      "rating": "7.1/10",
    },
    {
      "title": "27 Dresses",
      "genre": "Romance Comedy",
      "rating": "6.1/10",
    },
    {
      "title": "Set It Up",
      "genre": "Romance Comedy",
      "rating": "6.5/10",
    },
  ];

  Map<String, String>? selectedMovie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Romance Comedy Movies",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  final isSelected = selectedMovie == movie;

                  return Card(
                    color: isSelected
                        ? Colors.pink.shade100
                        : null,
                    child: ListTile(
                      title: Text(
                        movie["title"]!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(movie["genre"]!),
                      trailing: Text(movie["rating"]!),
                      onTap: () {
                        setState(() {
                          selectedMovie = movie;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            if (selectedMovie != null) ...[
              const SizedBox(height: 15),
              const Text(
                "Selected Movie",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Title: ${selectedMovie!["title"]}",
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                "Genre: ${selectedMovie!["genre"]}",
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                "Rating: ${selectedMovie!["rating"]}",
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ],
        ),
      ),
    );
  }
}