import 'package:flutter/material.dart';
import 'package:wheather_app/home_page.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    print('disposed');
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
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
                FocusScope.of(context).unfocus();
                Future.delayed(const Duration(milliseconds: 300),(() {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            HomePage(name: controller.text)),
                    (Route<dynamic> route) => false);
                }));
                
              },
              icon: const Icon(Icons.check)),
        ],
      ),
    );
  }
}
