import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:todo/model/todo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(const TodoInitial([]));

  void add(String name) {
    final Todo todo = Todo(name: name, createdAt: DateTime.now());
    emit(TodoSuccess([...state.todos, todo]));
  }
}
