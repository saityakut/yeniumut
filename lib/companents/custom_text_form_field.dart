import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? initValue;
  final String? hintText;
  final int? maxLine;
  final int? maxLength;
  final bool? obsucureText;
  final bool? readOnly;
  final double? verticalPadding;
  final double? horizantalPadding;
  final TextInputType? keyboardType;
  final IconData? icon;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function()? iconOnPress;

  const CustomTextFormField({
    Key? key,
    this.initValue,
    this.hintText,
    this.maxLine = 1,
    this.maxLength,
    this.obsucureText = false,
    this.readOnly = false,
    this.verticalPadding = 20,
    this.horizantalPadding = 30,
    this.icon,
    this.validator,
    this.onSaved,
    this.iconOnPress,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding!, horizontal: horizantalPadding!),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: keyboardType,
          obscureText: obsucureText!,
          maxLength: maxLength,
          maxLines: maxLine,
          readOnly: readOnly!,
          initialValue: initValue,
          validator: validator,
          onSaved: onSaved,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: iconOnPress,
              icon: Icon(
                icon,
                color: Colors.grey,
                size: 30,
              ),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.white),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
