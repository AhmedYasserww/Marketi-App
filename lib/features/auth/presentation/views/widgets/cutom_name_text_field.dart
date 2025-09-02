import 'package:flutter/material.dart';
import 'package:marketi_app/Core/widgets/custom_text_form_field_widget.dart';
class NameField extends StatelessWidget {
  final TextEditingController nameController;

  const NameField({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: nameController,
      validator: (value) => value == null || value.isEmpty ? 'Field is required' : null,
      prefixIcon: const Icon(Icons.person),
      labelText: const Text("UserName",style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),
    );
  }
}