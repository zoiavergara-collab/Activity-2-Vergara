import 'package:flutter/material.dart';

class SeatSelectionPage extends StatefulWidget {
  const SeatSelectionPage({super.key});

  @override
  State<SeatSelectionPage> createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  String selectedCategory = "Regular";
  final Set<String> selectedSeats = {};

  final Map<String, List<String>> seats = {
    "Regular": [
      "R1",
      "R2",
      "R3",
      "R4",
      "R5",
      "R6",
    ],
    "Premium": [
      "P1",
      "P2",
      "P3",
      "P4",
      "P5",
      "P6",
    ],
    "VIP": [
      "V1",
      "V2",
      "V3",
      "V4",
    ],
  };

  void selectCategory(String category) {
    setState(() {
      selectedCategory = category;
      selectedSeats.clear();
    });
  }

  void selectSeat(String seat) {
    setState(() {
      if (selectedSeats.contains(seat)) {
        selectedSeats.remove(seat);
      } else {
        selectedSeats.add(seat);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentSeats = seats[selectedCategory]!;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Seat Selection"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Seat Category",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => selectCategory("Regular"),
                    child: const Text("Regular"),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => selectCategory("Premium"),
                    child: const Text("Premium"),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => selectCategory("VIP"),
                    child: const Text("VIP"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Text(
              "$selectedCategory Seats",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: GridView.builder(
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 2,
                ),
                itemCount: currentSeats.length,
                itemBuilder: (context, index) {
                  final seat = currentSeats[index];
                  final isSelected = selectedSeats.contains(seat);

                  return GestureDetector(
                    onTap: () => selectSeat(seat),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.green
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isSelected
                              ? Colors.green.shade800
                              : Colors.grey,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          seat,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isSelected
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 15),

            Text(
              selectedSeats.isEmpty
                  ? "No seat selected"
                  : "Selected: ${selectedSeats.join(", ")}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}