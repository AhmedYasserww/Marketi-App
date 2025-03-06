import 'package:flutter/material.dart';
import '../../../../../Core/widgets/custom_text_form_field_widget.dart';
class NameField extends StatelessWidget {
  final TextEditingController nameController;

  const NameField({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: nameController,
      validator: (value) => value == null || value.isEmpty ? 'الاسم مطلوب' : null,
     hintText: "الاسم كامل",
    );
  }
}