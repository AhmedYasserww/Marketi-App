import 'package:bloc/bloc.dart';
import 'package:marketi_app/features/auth/data/model/auth_model.dart';
import 'package:marketi_app/features/auth/data/repos/auth_repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String confirmPassword,
  }) async {
    emit(SignUpLoading());

    final result = await authRepo.signUp(
      name: name,
      email: email,
      password: password,
      phone: phone,
      confirmPassword: confirmPassword,
    );

    result.fold((failure) => emit(SignUpFailure(errorMessage: failure.errorMessage)), (authModel) => emit(SignUpSuccess(authModel: authModel)));
  }
}
