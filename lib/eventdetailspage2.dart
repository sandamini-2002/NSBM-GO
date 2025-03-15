import 'package:flutter/material.dart';

class EventDetailPage2 extends StatelessWidget {
  final Map<String, String> event;

  EventDetailPage2({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section with Back Button & Logo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.green),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Spacer(),
                  Image.asset('assets/logo.png', height: 100),
                ],
              ),
            ),

            // Event Image with Shadow
// Event Image with Shadow
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center( // 💖 This will center the image!
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(event['image']!),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            // Event Title & Year
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event['title']!,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "2025",
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            // Status Indicators (Coming Soon & Not Confirmed)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  // Coming Soon Status
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.green, size: 18),
                        SizedBox(width: 5),
                        Text(
                          "Coming Soon",
                          style: TextStyle(color: Colors.green, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),

                  // Not Confirmed Status
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.black54, size: 18),
                        SizedBox(width: 5),
                        Text(
                          "NSBM Recreational Centre",
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 15),

            // Event Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Text(
                    "Get ready for an electrifying display of strength, skill, and discipline as NSBM proudly presents the NSBM Karate Championship 2025! Set to take place on 9th March 2025 at the NSBM Sports Complex, this highly anticipated event will bring together the finest martial artists from across the university to compete for glory.\n\n"
                        "With a thrilling lineup of matches, the championship promises intense battles, unwavering determination, and the true spirit of sportsmanship. A distinguished panel of judges, including Dr. Rasika Ranaweera, Mr. Wasantha Soysa, and Ms. Aushadharie Vidanalage, will oversee the competition, ensuring a fair and exciting tournament.\n\n"
                        "Whether you're competing or cheering from the sidelines, this is an event you won't want to miss! Stay tuned for more details and get ready to witness karate excellence in action!",
                    style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
