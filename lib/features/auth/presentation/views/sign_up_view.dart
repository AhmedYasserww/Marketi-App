import 'package:flutter/material.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/sign_up_view_body.dart';
class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
static const String routeName='signUpView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignUpViewBody(),
    );
  }
}
