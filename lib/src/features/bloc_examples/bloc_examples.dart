import 'package:bloc_examples/src/features/bloc_examples/bloc/example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocExemple extends StatelessWidget {
  const BlocExemple({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Exemples'),
      ),
      body: BlocListener<ExampleBloc, ExampleState>(
        listener: (context, state) {
          if (state is ExampleStateData) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('a quantidade é ${state.names.length}'),
              ),
            );
          }
        },
        child: Column(
          children: [
            BlocConsumer<ExampleBloc, ExampleState>(
              listener: (context, state) {
                print('estado alterado para ${state.runtimeType}');
              },
              builder: (_, state) {
                if (state is ExampleStateData) {
                  return Text('total de nomes é ${state.names.length}');
                }
                return const SizedBox.shrink();
              },
            ),
            BlocSelector<ExampleBloc, ExampleState, bool>(selector: (state) {
              if (state is ExampleStateInitial) {
                return true;
              }
              return false;
            }, builder: (context, showLoader) {
              if (showLoader) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return const SizedBox.shrink();
            }),
            BlocSelector<ExampleBloc, ExampleState, List<String>>(
                selector: (state) {
              if (state is ExampleStateData) {
                return state.names;
              }
              return [];
            }, builder: (context, names) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: names.length,
                itemBuilder: (context, index) {
                  final name = names[index];
                  return ListTile(
                    title: Text(name),
                  );
                },
              );
            }),
            // BlocBuilder<ExampleBloc, ExampleState>(
            //   builder: (context, state) {
            //     print(state.runtimeType);
            //     if (state is ExampleStateData) {
            //       return ListView.builder(
            //         shrinkWrap: true,
            //         itemCount: state.names.length,
            //         itemBuilder: (context, index) {
            //           final name = state.names[index];
            //           return ListTile(
            //             title: Text(name),
            //           );
            //         },
            //       );
            //     }
            //     return const Center(
            //       child: Text('nada cadastrado'),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
