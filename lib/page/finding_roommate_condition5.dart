import 'package:flutter/material.dart';

class PreferenceSharePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Share your living preferences',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Meet roommates that suits you',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Text(
              'Which lifestyle suits you better?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.orange,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            LifestyleOptionCard(
              type: 'Temperature Sensitive Type ',
              emoji: '🥵🥶',
              description:
                  "I can't tolerate hot or cold weather well and am sensitive to room temperature",
            ),
            SizedBox(height: 16),
            Text(
              'VS',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            LifestyleOptionCard(
              type: 'Temperature Tolerant Type',
              emoji: '😐',
              description:
                  "I can withstand hot or cold weather well and am not sensitive to room temperature.",
            ),
            Spacer(),
            Text(
              'For a better match, try not to use this \'skip\' too often.',
              style: TextStyle(
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // Handle skip
                  },
                  child: Text('Skip'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle next
                  },
                  child: Text('Next'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LifestyleOptionCard extends StatefulWidget {
  final String type;
  final String emoji;
  final String description;

  const LifestyleOptionCard({
    Key? key,
    required this.type,
    required this.emoji,
    required this.description,
  }) : super(key: key);

  @override
  _LifestyleOptionCardState createState() => _LifestyleOptionCardState();
}

class _LifestyleOptionCardState extends State<LifestyleOptionCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                widget.type,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.orange : Colors.black,
                ),
              ),
              SizedBox(height: 4),
              Text(
                widget.emoji,
                style: TextStyle(
                  fontSize: 24,
                  color: isSelected ? Colors.orange : Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                widget.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? Colors.orange : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: PreferenceSharePage(),
    ),
  );
}
