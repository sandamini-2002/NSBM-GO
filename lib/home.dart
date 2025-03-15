import 'package:flutter/material.dart';
import 'eventdetailspage.dart'; // Import the Event Details Page
import 'eventdetailspage2.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedIndex;

  final List<Map<String, String>> stories = [
    {'name': 'Global Youth Camp', 'image': 'assets/story1.png'},
    {'name': 'NSBM Special', 'image': 'assets/story2.png'},
    {'name': 'Dancing Club', 'image': 'assets/story3.png'},
    {'name': 'CCCI', 'image': 'assets/story4.png'},
  ];

  final List<Map<String, String>> eventPosts = [
    {
      'title': 'Siyapathsiya Udanaya 2025',
      'image': 'assets/aurudu.png',
      'description': 'As the spirit of 2025 keeps on painting a promising horizon... see more'
    },
    {
      'title': 'Inter-House Karate Tournament',
      'image': 'assets/karate.png',
      'description': '🔥 NSBM Sports Fiesta – Karate Championship 2025!🏆 ... see more'
    },
  ];

  void navigateToDetails(BuildContext context, int index) {
    setState(() {
      selectedIndex = index;
    });

    Future.delayed(Duration(milliseconds: 200), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => index == 0
              ? EventDetailPage(event: eventPosts[index])
              : EventDetailPage2(event: eventPosts[index]),
        ),
      ).then((_) {
        setState(() {
          selectedIndex = null;
        });
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Add this line
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Image.asset('assets/logo.png', height: 100),
            Spacer(),
            Icon(Icons.search, color: Colors.black),
            SizedBox(width: 15),
            Icon(Icons.notifications, color: Colors.black),
            SizedBox(width: 15),
            Icon(Icons.menu, color: Colors.black),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(stories[index]['image']!),
                        ),
                        SizedBox(height: 5),
                        Text(
                          stories[index]['name']!,
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "What’s Happening",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all view...",
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: eventPosts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => navigateToDetails(context, index),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        height: 250,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue,
                              blurRadius: 5,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(15),
                          color: selectedIndex == index ? Color(0xFFB7E3BC) : Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                                  image: DecorationImage(
                                    image: AssetImage(eventPosts[index]['image']!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    eventPosts[index]['title']!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    eventPosts[index]['description']!,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
