import 'package:flutter/material.dart';

class SubjectwiseQuran extends StatefulWidget {
  const SubjectwiseQuran({super.key});

  @override
  _SubjectwiseQuranState createState() => _SubjectwiseQuranState();
}

class _SubjectwiseQuranState extends State<SubjectwiseQuran> {
  String? _selectedTranslation = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            'Quran Search',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              hintText: 'Search by Words',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Recent Search',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Chip(label: Text('Al-Fatiha')),
                              SizedBox(width: 8),
                              Chip(label: Text('An-Nisa')),
                              SizedBox(width: 8),
                              Chip(label: Text('Al-Baqarah')),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Search in',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Radio(value: 1, groupValue: 1, onChanged: (_) {}),
                              const Text('Translation'),
                              Radio(value: 2, groupValue: 1, onChanged: (_) {}),
                              const Text('Tafseer'),
                              Radio(value: 3, groupValue: 1, onChanged: (_) {}),
                              const Text('Arabic Ayah'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Choose Translation (Select up to 3)',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          value: _selectedTranslation,
                          items: const [
                            DropdownMenuItem(
                              value: 'English',
                              child: Text('English'),
                            ),
                            DropdownMenuItem(
                              value: 'Arabic',
                              child: Text('Arabic'),
                            ),
                            DropdownMenuItem(
                              value: 'Urdu',
                              child: Text('Urdu'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedTranslation = value;
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 48),
                          ),
                          child: const Text('Search'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: const Text('Open Popup'),
        ),
      ),
    );
  }
}
