import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/core/utils/app_images.dart';
import 'package:marketi_app/core/widgets/custom_button.dart';
import 'package:marketi_app/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/confirm_passord_field_widget.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/custom_email_text_field.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/custom_password_text_field.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/custom_phone_number_text_field.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/cutom_name_text_field.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/social_icon_widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool visiblePassword = true;
  bool visibleConfirmPassword = true;

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  void togglePasswordVisibility() {
    setState(() => visiblePassword = !visiblePassword);
  }

  void toggleConfirmPasswordVisibility() {
    setState(() => visibleConfirmPassword = !visibleConfirmPassword);
  }

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.authModel.message),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.pop(context);
            } else if (state is SignUpFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading,
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
                      const SizedBox(height: 12),
                      NameField(nameController: nameController),
                      const SizedBox(height: 14),
                      PhoneNumberField(phoneNumberController: phoneNumberController),
                      const SizedBox(height: 14),
                      EmailField(emailController: emailController),
                      const SizedBox(height: 14),
                      PasswordField(
                        passwordController: passwordController,
                        visible: visiblePassword,
                        toggleVisibility: togglePasswordVisibility,
                      ),
                      const SizedBox(height: 14),
                      ConfirmPasswordField(
                        confirmPasswordController: confirmPasswordController,
                        visible: visibleConfirmPassword,
                        toggleVisibility: toggleConfirmPasswordVisibility,
                      ),
                      const SizedBox(height: 14),
                      CustomButton(
                        text: "Sign up",
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            context.read<SignUpCubit>().signUp(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              phone: phoneNumberController.text,
                              confirmPassword: confirmPasswordController.text,
                            );
                          } else {
                            setState(() => autoValidateMode = AutovalidateMode.always);
                          }
                        },
                      ),
                      const SizedBox(height: 24),
                      const SocialIconsWidget(),
                      const SizedBox(height: 14),
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
