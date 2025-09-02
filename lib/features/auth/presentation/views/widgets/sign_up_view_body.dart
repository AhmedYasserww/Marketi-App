import 'package:flutter/material.dart';
import 'package:marketi_app/core/utils/app_images.dart';
import 'package:marketi_app/core/widgets/custom_button.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/confirm_passord_field_widget.dart';

import 'package:marketi_app/features/auth/presentation/views/widgets/custom_email_text_field.dart';

import 'package:marketi_app/features/auth/presentation/views/widgets/custom_navigate_to_register.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/custom_password_text_field.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/custom_phone_number_text_field.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/cutom_name_text_field.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/social_icon_widgets.dart';

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
    setState(() {
      visiblePassword = !visiblePassword;
    });
  }

  void toggleConfirmPasswordVisibility() {
    setState(() {
      visibleConfirmPassword = !visibleConfirmPassword;
    });
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
                const SizedBox(height: 14,),

             CustomButton(text:"Sign up",
               onTap: (){

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
    );
  }
}
