import 'package:flutter/material.dart';

import 'list_view_exercise_page.dart';
import 'grid_view_exercise_page.dart';
import 'shared_preferences_exercise_page.dart';
import 'async_exercise_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void openPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    final exercises = [
      {
        'title': 'Bài 1: ListView',
        'subtitle': 'Danh sách contacts có avatar',
        'page': const ListViewExercisePage(),
        'icon': Icons.list,
      },
      {
        'title': 'Bài 2: GridView',
        'subtitle': 'GridView.count và GridView.extent',
        'page': const GridViewExercisePage(),
        'icon': Icons.grid_view,
      },
      {
        'title': 'Bài 3: SharedPreferences',
        'subtitle': 'Lưu và hiển thị tên người dùng',
        'page': const SharedPreferencesExercisePage(),
        'icon': Icons.save,
      },
      {
        'title': 'Bài 4: Async Programming',
        'subtitle': 'Loading user trong 3 giây',
        'page': const AsyncExercisePage(),
        'icon': Icons.timer,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 4 Exercises'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final item = exercises[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(item['icon'] as IconData),
              ),
              title: Text(item['title'] as String),
              subtitle: Text(item['subtitle'] as String),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                openPage(context, item['page'] as Widget);
              },
            ),
          );
        },
      ),
    );
  }
}