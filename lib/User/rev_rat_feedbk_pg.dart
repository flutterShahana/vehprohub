import 'package:flutter/material.dart';

class ReviewRatingFeedbackPage extends StatefulWidget {
  const ReviewRatingFeedbackPage({Key? key}) : super(key: key);

  @override
  _ReviewRatingFeedbackPageState createState() => _ReviewRatingFeedbackPageState();
}

class _ReviewRatingFeedbackPageState extends State<ReviewRatingFeedbackPage> {
  double _rating = 0;
  String _review = '';
  String _feedback = '';

  void _submitReview() {
    // Perform submission of review, rating, and feedback
    // You can handle the logic here, such as sending the data to a backend server

    // Reset the form
    setState(() {
      _rating = 0;
      _review = '';
      _feedback = '';
    });

    // Show a confirmation dialog or navigate to another screen
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Review Submitted'),
        content: const Text('Thank you for submitting your review and feedback!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review, Rating & Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Rating',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.star, color: _rating >= 1 ? Colors.orange : Colors.grey),
                  onPressed: () {
                    setState(() {
                      _rating = 1;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.star, color: _rating >= 2 ? Colors.orange : Colors.grey),
                  onPressed: () {
                    setState(() {
                      _rating = 2;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.star, color: _rating >= 3 ? Colors.orange : Colors.grey),
                  onPressed: () {
                    setState(() {
                      _rating = 3;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.star, color: _rating >= 4 ? Colors.orange : Colors.grey),
                  onPressed: () {
                    setState(() {
                      _rating = 4;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.star, color: _rating >= 5 ? Colors.orange : Colors.grey),
                  onPressed: () {
                    setState(() {
                      _rating = 5;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Review',
            ),
            const SizedBox(height: 8),
            TextField(
              maxLines: 4,
              onChanged: (value) {
                setState(() {
                  _review = value;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Write your review...',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Feedback',
            ),
            const SizedBox(height: 8),
            TextField(
              maxLines: 4,
              onChanged: (value) {
                setState(() {
                  _feedback = value;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Write your feedback...',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitReview,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
