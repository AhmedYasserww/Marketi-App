import 'package:bloc/bloc.dart';
import 'package:marketi_app/features/auth/data/model/auth_model.dart';
import 'package:marketi_app/features/auth/data/repos/auth_repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepo authRepo;
  SignInCubit(this.authRepo) : super(SignInInitial());

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());

    final result = await authRepo.signIn(
      email: email,
      password: password,
    );

    result.fold(
          (failure) => emit(SignInFailure(errorMessage: failure.errorMessage)),
          (authModel) => emit(SignInSuccess(authModel: authModel)),
    );
  }
}
