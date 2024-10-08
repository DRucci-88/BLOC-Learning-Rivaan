import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
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
    });
    on<AuthLogoutRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await Future.delayed(const Duration(seconds: 1));
        emit(AuthInitial());
        return;
      } catch (e) {
        emit(AuthFailure(error: e.toString()));
        return;
      }
    });
  }
}
