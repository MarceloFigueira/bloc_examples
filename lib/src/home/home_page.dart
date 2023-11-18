import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Bloc'),
      ),
      body: Center(
        child: ElevatedButton(
            child: const Text('Bloc Examples'),
            onPressed: () {
              Navigator.of(context).pushNamed('/bloc/example');
            }),
      ),
    );
  }
}
