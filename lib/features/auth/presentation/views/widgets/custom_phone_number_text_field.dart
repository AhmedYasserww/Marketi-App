import 'package:flutter/material.dart';
import '../../../../../Core/widgets/custom_text_form_field_widget.dart';


class PhoneNumberField extends StatelessWidget {
  final TextEditingController phoneNumberController;

  const PhoneNumberField({super.key, required this.phoneNumberController});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: phoneNumberController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required. Please enter a phone number.';
        } else if (value.length != 11) {
          return 'Phone number must be exactly 11 digits long.';
        }
        return null;
      },
      prefixIcon: const Icon(Icons.phone_android),
      labelText: const Text("phoneNumber",style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),

    );
  }
}
