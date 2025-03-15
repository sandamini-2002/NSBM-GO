import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FacultyOfBusinessScreen(),
  ));
}

class FacultyOfBusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'assets/logo image.png',
          height: 40,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Faculty Image
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/FOB faculty image.jpeg',
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Faculty Title
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Faculty Of Business",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Grid of Clubs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.3,
                ),
                itemCount: clubs.length,
                itemBuilder: (context, index) {
                  return ClubCard(club: clubs[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Data Model for Clubs
class Club {
  final String name;
  final String imageUrl;
  final String description;

  Club({required this.name, required this.imageUrl, required this.description});
}

// Club List
List<Club> clubs = [
  Club(
    name: "Young Business Researcher's Club",
    imageUrl: "assets/fob club 1 image.jpg",
    description: "A club for young entrepreneurs to explore business research.",
  ),
  Club(
    name: "Student Circle of Accounting and Finance",
    imageUrl: "assets/fob club 2 image.jpg",
    description: "A club for Student Circle of Accounting and Finance",
  ),
  Club(
    name: "International Centre for Cultural Exchange",
    imageUrl: "assets/fob club 3 image.jpg",
    description: "A hub for cultural diversity and student collaboration.",
  ),
  Club(
    name: "Entrepreneurship Circle",
    imageUrl: "assets/fob club 4 image.jpg",
    description: "A community for aspiring entrepreneurs and startups.",
  ),
];

// Club Card Widget
class ClubCard extends StatefulWidget {
  final Club club;

  ClubCard({required this.club});

  @override
  _ClubCardState createState() => _ClubCardState();
}

class _ClubCardState extends State<ClubCard> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isTapped = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isTapped = false;
        });

        // Navigate to the details page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClubDetailsScreen(club: widget.club),
          ),
        );
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isTapped ? const Color.fromARGB(255, 77, 219, 74).withOpacity(0.5) : Colors.transparent,
          image: DecorationImage(
            image: NetworkImage(widget.club.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withOpacity(0.5),
          ),
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.club.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Club Details Screen
class ClubDetailsScreen extends StatelessWidget {
  final Club club;

  ClubDetailsScreen({required this.club});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(club.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                club.imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              club.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              club.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
