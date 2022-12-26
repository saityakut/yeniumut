import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? butonText;
  final void Function()? onpressed;
  final double? width;
  final double? height;
  final double? verticalPadding;
  final double? horizantalPadding;

  const CustomButton({
    Key? key,
    this.butonText,
    this.onpressed,
    this.width,
    this.height = 50,
    this.verticalPadding = 8.0,
    this.horizantalPadding = 30.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding!,
        horizontal: horizantalPadding!,
      ),
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              15,
            ),
          ),
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          primary: Color(
            0xFF006B96,
          ),
          fixedSize: Size(
            width ?? MediaQuery.of(context).size.width * 0.2,
            height!,
          ),
        ),
        child: Text(
          butonText!,
        ),
      ),
    );
  }
}
