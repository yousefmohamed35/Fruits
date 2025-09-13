import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

bool isObscure = true;

class _PasswordFormFieldState extends State<PasswordFormField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: isObscure,
      onSaved: widget.onSaved,
      hintText: 'كلمة المرور',
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            isObscure = !isObscure;
          });
        },
        icon: Icon(
          isObscure ? Icons.visibility : Icons.visibility_off,
          color: Color(0xffC9CECF),
        ),
      ),
    );
  }
}
