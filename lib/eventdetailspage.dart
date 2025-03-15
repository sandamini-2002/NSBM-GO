import 'package:flutter/material.dart';

class EventDetailPage extends StatelessWidget {
  final Map<String, String> event;

  EventDetailPage({required this.event});

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
                          "Not Confirmed",
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
                    "As the spirit of 2025 keeps on painting a promising horizon, NSBM has set the stage early for one of its most anticipated annual events—'Siyapathsiya Udanaya 2025: Awurudu Kumara Saha Kumariya.'\n\n"
                        "The excitement unfolded on 6th February 2025 at the NSBM Auditorium with Day 1 of Round 01, marking a spectacular start to this iconic competition. Over 200 enthusiastic NSBM undergraduates brought their charisma, talent, and cultural flair to the stage, making the event a vibrant showcase of tradition and creativity.\n\n"
                        "Adding prestige to the occasion, the distinguished panel of judges included Ms. Thilini De Silva, Dean of the Faculty of Business; Ms. Upeksha Hettiathanthri, Head of the Department of Design Studies; and Mr. Dilupa Wijerathna, Cultural Coordinator of NSBM.",
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
