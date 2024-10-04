import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? selectedLocation; // This will hold the selected dropdown value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(26),
            bottomRight: Radius.circular(26),
          ),
        ),
        title: const Text(
          'COURSE COMPASS',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50), // Space between AppBar and the text
            const Text(
              'In that case, here are the best courses that\nalign with your interests!',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedLocation, // Bind selected value
                      hint: const Text('Any Location'),
                      items: <String>[
                        'Makati City', 
                        'Pasig City', 
                        'Manila City', 
                        'Quezon City', 
                        'Taguig City'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedLocation = newValue; // Update selected value
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Space between dropdown and content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildCourseContainer('Course 1', 'Location 1', 'University 1', context),
                    const SizedBox(height: 10),
                    buildCourseContainer('Course 2', 'Location 2', 'University 2', context),
                    const SizedBox(height: 10),
                    buildCourseContainer('Course 3', 'Location 3', 'University 3', context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function that builds a clickable container
  Widget buildCourseContainer(String course, String location, String university, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CourseDetailPage(course: course)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(course, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(location, style: const TextStyle(fontSize: 16)),
            Text(university, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

// New page that will be displayed when a course is clicked
class CourseDetailPage extends StatelessWidget {
  final String course;

  const CourseDetailPage({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course),
      ),
      body: Center(
        child: Text(
          'Details for $course',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
