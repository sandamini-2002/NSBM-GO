import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SportsClubsPage(),
    );
  }
}

class SportsClubsPage extends StatefulWidget {
  @override
  _SportsClubsPageState createState() => _SportsClubsPageState();
}

class _SportsClubsPageState extends State<SportsClubsPage> {
  int? highlightedIndex;

  final List<Map<String, String>> clubs = [
    {'name': 'ATHLETICS CLUB', 'image': 'assets/athlatic.jpg'},
    {'name': 'BADMINTON CLUB', 'image': 'assets/batmintan.jpg'},
    {'name': 'CHESS CLUB', 'image': 'assets/chess.jpg'},
    {'name': 'NETBALL CLUB', 'image': 'assets/netball.jpg'},
    {'name': 'CRICKET CLUB', 'image': 'assets/ckricket.jpg'},
    {'name': 'MARTIAL ARTS CLUB', 'image': 'assets/martial arat.jpg'},
    {'name': 'RUGBY CLUB', 'image': 'assets/rugby.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'SPORTS CLUBS',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            Image.asset(
              'assets/logo.png', // Ensure the logo path is correct
              height: 30, // Small size logo
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: const Color.fromARGB(255, 90, 89, 89)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.1,
          ),
          itemCount: clubs.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  highlightedIndex = index;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClubDetailPage(
                      clubName: clubs[index]['name']!,
                      clubImage: clubs[index]['image']!,
                    ),
                  ),
                );
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: highlightedIndex == index
                      ? const Color.fromARGB(255, 149, 231, 152).withOpacity(0.7)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(4, 4),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 4,
                      offset: Offset(-4, -4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      clubs[index]['image']!,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 8),
                    Text(
                      clubs[index]['name']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: highlightedIndex == index ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ClubDetailPage extends StatelessWidget {
  final String clubName;
  final String clubImage;

  ClubDetailPage({required this.clubName, required this.clubImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(clubName),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(clubImage, height: 200),
            SizedBox(height: 20),
            Text(
              clubName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
   