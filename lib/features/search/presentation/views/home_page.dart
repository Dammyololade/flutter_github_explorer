import 'package:flutter/material.dart';
import 'package:flutter_github_explorer/core/utils/route_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Explorer'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Welcome to GitHub Explorer',
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 32,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RouteManager.search);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('Search for a repository',
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center
              ),
            ),
          )
        ],
      ),
    );
  }
}
