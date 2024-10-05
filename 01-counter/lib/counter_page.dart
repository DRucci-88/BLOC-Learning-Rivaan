import 'package:counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "increment",
            onPressed: () => counterCubit.increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () => counterCubit.decerement(),
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
