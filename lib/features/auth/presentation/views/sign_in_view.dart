import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/core/service_locator/service_locator.dart';
import 'package:marketi_app/features/auth/data/repos/auth_repo/auth_repo.dart';
import 'package:marketi_app/features/auth/data/repos/auth_repo/auth_repo_imp.dart';
import 'package:marketi_app/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = 'sign-in';

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (_) => SignInCubit(getIt.get<AuthRepoImpl>()),
      child: const Scaffold(

        body:SignInViewBody() ,
      ),
    );
  }
}
