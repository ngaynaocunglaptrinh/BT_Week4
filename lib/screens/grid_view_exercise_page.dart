import 'package:flutter/material.dart';

class GridViewExercisePage extends StatelessWidget {
  const GridViewExercisePage({super.key});

  final List<IconData> icons = const [
    Icons.home,
    Icons.star,
    Icons.favorite,
    Icons.phone,
    Icons.email,
    Icons.camera_alt,
    Icons.music_note,
    Icons.book,
    Icons.map,
    Icons.shopping_cart,
    Icons.person,
    Icons.settings,
  ];

  Widget buildGridItem(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icons[index],
            size: 36,
            color: Colors.blue,
          ),
          const SizedBox(height: 8),
          Text(
            'Item ${index + 1}',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 2: GridView'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionTitle('Fixed Column Grid'),

            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                12,
                    (index) => buildGridItem(index),
              ),
            ),

            buildSectionTitle('Responsive Grid'),

            GridView.extent(
              maxCrossAxisExtent: 150,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                12,
                    (index) => buildGridItem(index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}