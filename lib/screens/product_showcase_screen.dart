import 'package:flutter/material.dart';

class ProductShowcaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Showcase')),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ProductItem(
            name: 'New Feature 1',
            description: 'Real-time posture tracking with enhanced sensors.',
            imageUrl: 'assets/feature1.png', // Example image path
            onMoreInfo: () {
              // Navigate to a detailed page or open a link
            },
          ),
          ProductItem(
            name: 'Smart Yoga Mat Pro',
            description: 'Advanced yoga mat with multi-zone feedback.',
            imageUrl: 'assets/yoga_mat_pro.png', // Example image path
            onMoreInfo: () {
              // Navigate to a detailed page or open a link
            },
          ),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;
  final VoidCallback onMoreInfo;

  ProductItem({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.onMoreInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl, height: 150), // Display the product image
            SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(description),
            SizedBox(height: 10),
            TextButton(
              onPressed: onMoreInfo,
              child: Text('More Info'),
              style: TextButton.styleFrom(primary: Colors.teal),
            ),
          ],
        ),
      ),
    );
  }
}
