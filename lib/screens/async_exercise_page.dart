import 'package:flutter/material.dart';

class AsyncExercisePage extends StatefulWidget {
  const AsyncExercisePage({super.key});

  @override
  State<AsyncExercisePage> createState() => _AsyncExercisePageState();
}

class _AsyncExercisePageState extends State<AsyncExercisePage> {
  String message = 'Loading user...';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      message = 'User loaded successfully!';
      isLoading = false;
    });
  }

  Future<void> reloadUser() async {
    setState(() {
      message = 'Loading user...';
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      message = 'User loaded successfully!';
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 4: Async Programming'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading) const CircularProgressIndicator(),

            const SizedBox(height: 20),

            Text(
              message,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: reloadUser,
              child: const Text('Load Again'),
            ),
          ],
        ),
      ),
    );
  }
}