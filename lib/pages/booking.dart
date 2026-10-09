import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  String? classification;
  String? movieType;

  void checkAge(String value) {
    int? age = int.tryParse(value);

    setState(() {
      if (age == null) {
        classification = null;
      } else if (age < 13) {
        classification = "Child";
      } else if (age <= 17) {
        classification = "Teen";
      } else if (age <= 59) {
        classification = "Adult";
      } else {
        classification = "Senior";
      }
    });
  }

  void bookNow() {
    if (nameController.text.trim().length < 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Customer Name must be at least 5 characters."),
        ),
      );
      return;
    }

    if (ageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Age is required."),
        ),
      );
      return;
    }

    if (movieType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select a movie type."),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Booking successful!"),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Customer Name",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter customer name",
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Age",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                onChanged: checkAge,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter age",
                ),
              ),

              const SizedBox(height: 10),

              if (classification != null)
                Text(
                  "Classification: $classification",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              const SizedBox(height: 25),

              const Text(
                "Movie Type",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              RadioListTile<String>(
                title: const Text("Regular"),
                value: "Regular",
                groupValue: movieType,
                onChanged: (value) {
                  setState(() {
                    movieType = value;
                  });
                },
              ),

              RadioListTile<String>(
                title: const Text("IMAX"),
                value: "IMAX",
                groupValue: movieType,
                onChanged: (value) {
                  setState(() {
                    movieType = value;
                  });
                },
              ),

              RadioListTile<String>(
                title: const Text("4DX"),
                value: "4DX",
                groupValue: movieType,
                onChanged: (value) {
                  setState(() {
                    movieType = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: bookNow,
                  child: const Text("Book Now"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}