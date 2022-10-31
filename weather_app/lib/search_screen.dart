import 'package:flutter/material.dart';
import 'package:wheather_app/home_page.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(
            hintText: 'London',
            fillColor: Colors.white,
            filled: true,
          ),
          controller: controller,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            HomePage(name: controller.text)));
              },
              icon: const Icon(Icons.check)),
        ],
      ),
    );
  }
}
