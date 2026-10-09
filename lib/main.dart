import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'pages/booking.dart';
import 'pages/seatselection.dart';
import 'pages/movies.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Homepage(),
        '/booking': (context) => const BookingPage(),
        '/seats': (context) => const SeatSelectionPage(),
        '/movies': (context) => const MoviesPage(),
      },
    );
  }
}