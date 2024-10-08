import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);
    print(this);
    print('AuthBloc transition - $transition');
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    print('AuthBloc change - $change');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('AuthBloc error - ${error.toString()}');
  }

  void _onAuthLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());
      final email = event.email;
      final password = event.password;
      await Future.delayed(const Duration(seconds: 2));
      if (password.length < 6) {
        emit(AuthFailure(error: 'Password cannot be less then 6 characters'));
        return;
      }

      await Future.delayed(
        const Duration(seconds: 3),
        () {
          emit(AuthSuccess(uid: '$email-$password'));
          return;
        },
      );
    } catch (e) {
      return emit(AuthFailure(error: e.toString()));
    }
  }

  void _onAuthLogoutRequested(
      AuthLogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(AuthInitial());
      return;
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
      return;
    }
  }
}
