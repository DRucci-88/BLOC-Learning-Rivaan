import 'package:counter/bloc/counter_bloc.dart';
import 'package:counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "cubit increment",
            onPressed: () => counterCubit.increment(),
            tooltip: 'Cubit Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 'cubit decrement',
            onPressed: () => counterCubit.decrement(),
            tooltip: 'Cubit Decrement',
            child: const Icon(Icons.minimize),
          ),
          FloatingActionButton(
            heroTag: "bloc increment",
            onPressed: () => counterBloc.add(CounterIncremented()),
            tooltip: 'Bloc Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 'bloc decrement',
            onPressed: () => counterBloc.add(CounterDecremented()),
            tooltip: 'Bloc Decrement',
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
