import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CineLove"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),

              const Text(
                "CineLove Cinema",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                "Your perfect place for romance, laughter, and unforgettable movie moments. Enjoy the latest romantic comedies with your favorite people.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 35),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Popular Romance Comedy Movies",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text("Anyone But You"),
                  subtitle: const Text(
                    "A fun romantic comedy filled with unexpected chemistry.",
                  ),
                ),
              ),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text("The Proposal"),
                  subtitle: const Text(
                    "A hilarious fake relationship that becomes something more.",
                  ),
                ),
              ),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text("10 Things I Hate About You"),
                  subtitle: const Text(
                    "A classic romantic comedy about love, friendship, and teenage chaos.",
                  ),
                ),
              ),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text("Crazy Rich Asians"),
                  subtitle: const Text(
                    "A romantic comedy filled with love, family, and unexpected challenges.",
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/seats');
                  },
                  child: const Text("Seat Selection"),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/movies');
                  },
                  child: const Text("Movies"),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/booking');
                  },
                  child: const Text("Back to Booking"),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}