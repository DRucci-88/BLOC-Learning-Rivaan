import 'package:counter/bloc/counter_bloc.dart';
import 'package:counter/counter_page.dart';
import 'package:counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // final counterCubit = BlocProvider.of<CounterCubit>(context);
    // final counterBloc = BlocProvider.of<CounterBloc>(context);

    print("home_page build");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, int>(
              // bloc: counterCubit, // optional
              builder: (context, count) {
                print("cubid $count");
                return Text(
                  'Cubit $count',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            BlocBuilder<CounterBloc, int>(
              // bloc: counterBloc, // Optional
              builder: (context, count) {
                print("bloc $count");
                return Text(
                  'Bloc $count',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Go to Counter Page",
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const CounterPage();
            },
          ));
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
