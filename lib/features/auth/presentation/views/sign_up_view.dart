import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/core/service_locator/service_locator.dart';
import 'package:marketi_app/features/auth/data/repos/auth_repo/auth_repo_imp.dart';
import 'package:marketi_app/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/sign_up_view_body.dart';
class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
static const String routeName='signUpView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(getIt.get<AuthRepoImpl>() ),
      child: const Scaffold(
        body: SignUpViewBody(),
      ),
    );
  }
}
