import 'package:bloc_examples/src/features/bloc_examples/bloc/example_bloc.dart';
import 'package:bloc_examples/src/features/bloc_examples/bloc_examples.dart';
import 'package:bloc_examples/src/features/bloc_examples/bloc_freezed/example_freezed_bloc.dart';
import 'package:bloc_examples/src/features/bloc_examples/bloc_freezed_examples.dart';
import 'package:bloc_examples/src/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (_) => const HomePage(),
        '/bloc/example': (_) => BlocProvider(
              create: (_) => ExampleBloc()..add(ExampleFindNameEvent()),
              child: const BlocExemple(),
            ),
        '/bloc/example/freezed': (context) => BlocProvider(
              create: (context) => ExampleFreezedBloc()
                ..add(const ExampleFreezedEvent.findNames()),
              child: const BlocFreezedExample(),
            )
      },
    );
  }
}
