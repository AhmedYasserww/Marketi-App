import 'package:flutter/material.dart';
import 'package:marketi_app/core/utils/app_images.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/custom_email_text_field.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/custom_password_text_field.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  bool visible = true;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  void toggleVisibility() {
    setState(() {
      visible = !visible;
    });
  }
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }
  @override
  dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              Center(child: Image.asset(AppImages.logo)),
              EmailField(emailController: emailController),
              PasswordField(passwordController: passwordController , visible: visible, toggleVisibility: toggleVisibility,)


            ],
          ),
        ),
      ),
    );
  }
}
