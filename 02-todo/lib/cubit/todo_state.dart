part of 'todo_cubit.dart';

@immutable
sealed class TodoState {
  final List<Todo> todos;

  const TodoState(this.todos);
}

final class TodoInitial extends TodoState {
  const TodoInitial(super.todos);
}

final class TodoSuccess extends TodoState {
  const TodoSuccess(super.todos);
}
