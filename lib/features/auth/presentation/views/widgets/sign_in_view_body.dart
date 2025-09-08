import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/core/local_data/save_user_date.dart';
import 'package:marketi_app/core/utils/app_images.dart';
import 'package:marketi_app/core/widgets/custom_button.dart';
import 'package:marketi_app/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:marketi_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/custom_email_text_field.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/custom_navigate_to_register.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/custom_password_text_field.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/custom_remember_me.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/social_icon_widgets.dart';
import 'package:marketi_app/features/navigation_bar/presentation/views/button_nav_bar_view.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  bool visible = true;
  bool rememberMe = false;
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

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) async{
        if (state is SignInSuccess) {
          await AppPreferences.saveUserData(state.authModel);
          Navigator.pushReplacementNamed(context, ButtonNavBarView.routeName);
        } else if (state is SignInFailure) {
          showErrorMessage(state.errorMessage);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Center(
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
                        const SizedBox(height: 20),
                        CustomRememberMe(
                          isChecked: rememberMe,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value;
                            });
                          },
                        ),
                        const SizedBox(height: 14),
                        CustomButton(
                          text: "Log in",
                          onTap: () {
                            if (!rememberMe) {
                              showErrorMessage(
                                  "Please check 'Remember me' before logging in");
                              return;
                            }
                            if (formKey.currentState!.validate()) {
                              context.read<SignInCubit>().signIn(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            } else {
                              setState(() {
                                autoValidateMode = AutovalidateMode.always;
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 14),
                        const SocialIconsWidget(),
                        const SizedBox(height: 14),
                        CustomNavigateToRegister(
                          onPressed: () {
                            Navigator.of(context).pushNamed(SignUpView.routeName);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // ⬇ Loading overlay
            if (state is SignInLoading)
              Container(
                color: Colors.black.withOpacity(0.4),
                child: const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 6,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
