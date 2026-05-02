import 'package:flutter/material.dart';

class ListViewExercisePage extends StatelessWidget {
  const ListViewExercisePage({super.key});

  final List<Map<String, String>> contacts = const [
    {'name': 'Nguyễn Văn An', 'phone': '0901 111 111'},
    {'name': 'Trần Thị Bình', 'phone': '0902 222 222'},
    {'name': 'Lê Hoàng Cường', 'phone': '0903 333 333'},
    {'name': 'Phạm Minh Đức', 'phone': '0904 444 444'},
    {'name': 'Võ Thanh Hà', 'phone': '0905 555 555'},
    {'name': 'Đặng Quốc Huy', 'phone': '0906 666 666'},
    {'name': 'Bùi Ngọc Lan', 'phone': '0907 777 777'},
    {'name': 'Đỗ Anh Minh', 'phone': '0908 888 888'},
    {'name': 'Hoàng Gia Nam', 'phone': '0909 999 999'},
    {'name': 'Vũ Thảo My', 'phone': '0910 101 010'},
    {'name': 'Phan Quốc Khang', 'phone': '0911 111 222'},
    {'name': 'Mai Thanh Tùng', 'phone': '0912 222 333'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 1: ListView Contacts'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: CircleAvatar(
                radius: 26,
                backgroundColor: Colors.blue.shade100,
                child: const Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
              ),
              title: Text(
                contact['name']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(contact['phone']!),
              trailing: const Icon(Icons.phone),
            ),
          );
        },
      ),
    );
  }
}