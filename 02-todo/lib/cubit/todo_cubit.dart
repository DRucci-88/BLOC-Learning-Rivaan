import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:todo/model/todo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(const TodoInitial([]));

  void add(String name) {
    if (name.isEmpty) {
      addError('Title cannot be empty');
      return;
    }
    final Todo todo = Todo(name: name, createdAt: DateTime.now());
    emit(TodoSuccess([...state.todos, todo]));
  }

  @override
  void onChange(Change<TodoState> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}
