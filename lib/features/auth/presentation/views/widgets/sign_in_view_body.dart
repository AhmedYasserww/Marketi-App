import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/core/utils/app_images.dart';
import 'package:marketi_app/core/widgets/custom_button.dart';
import 'package:marketi_app/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:marketi_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/custom_email_text_field.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/custom_navigate_to_register.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/custom_password_text_field.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/custom_remember_me.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/social_icon_widgets.dart';
import 'package:marketi_app/features/home/presentation/views/home_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
      listener: (context, state) {
        if (state is SignInSuccess) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        } else if (state is SignInFailure) {
          showErrorMessage(state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignInLoading,
          opacity: 0.4,
          color: Colors.black,
          progressIndicator: const CircularProgressIndicator(
            strokeWidth: 6,
            color: Colors.deepPurple,
          ),
          child: Center(
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
                          if(!rememberMe) {
                            showErrorMessage("Please check 'Remember me' before logging in");
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
        );
      },
    );
  }
}
