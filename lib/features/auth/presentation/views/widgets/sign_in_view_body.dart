import 'package:flutter/material.dart';
import 'package:marketi_app/core/utils/app_images.dart';
import 'package:marketi_app/core/widgets/custom_button.dart';
import 'package:marketi_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/custom_email_text_field.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/custom_navigate_to_register.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/custom_password_text_field.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/custom_remember_me.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/social_icon_widgets.dart';
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
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Form(
            key: formKey,
            autovalidateMode: autoValidateMode,
            child: Column(
              children: [
                Center(child: Image.asset(AppImages.logo)),
                const SizedBox(height: 32),
                EmailField(emailController: emailController),
                const SizedBox(height: 14),
                PasswordField(
                  passwordController: passwordController,
                  visible: visible,
                  toggleVisibility: toggleVisibility,
                ),
                const SizedBox(height: 12),
                const CustomRememberMe(),
                const SizedBox(height: 20),
                CustomButton(
                  text: "Log in",
                  onTap:(){

                  } ,
                ),
                SizedBox(height: 14,),
                const SocialIconsWidget(),
                const SizedBox(height: 14,),
                CustomNavigateToRegister(
                  onPressed: (){
Navigator.of(context).pushNamed(SignUpView.routeName);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



