import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesExercisePage extends StatefulWidget {
  const SharedPreferencesExercisePage({super.key});

  @override
  State<SharedPreferencesExercisePage> createState() =>
      _SharedPreferencesExercisePageState();
}

class _SharedPreferencesExercisePageState
    extends State<SharedPreferencesExercisePage> {
  final TextEditingController nameController = TextEditingController();

  String resultText = 'Chưa có dữ liệu';

  Future<void> saveName() async {
    final name = nameController.text.trim();

    if (name.isEmpty) {
      setState(() {
        resultText = 'Vui lòng nhập tên trước khi lưu';
      });
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', name);

    setState(() {
      resultText = 'Đã lưu tên: $name';
    });
    nameController.clear();
  }

  Future<void> showName() async {
    final prefs = await SharedPreferences.getInstance();
    final savedName = prefs.getString('username');
    setState(() {
      if (savedName == null || savedName.isEmpty) {
        resultText = 'No name saved';
      } else {
        resultText = 'Tên đã lưu: $savedName';
      }
    });
  }

  Future<void> clearName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    setState(() {
      resultText = 'Đã xóa dữ liệu';
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 3: SharedPreferences'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nhập tên',
                hintText: 'Ví dụ: Hoàng Quốc',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveName,
                child: const Text('Save Name'),
              ),
            ),

            const SizedBox(height: 8),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: showName,
                child: const Text('Show Name'),
              ),
            ),

            const SizedBox(height: 8),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: clearName,
                child: const Text('Clear'),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              resultText,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}