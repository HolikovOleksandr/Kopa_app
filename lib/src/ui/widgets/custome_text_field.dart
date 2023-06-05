import 'package:kopa/src/core/ui/widgets/base_statefull_widget.dart';
import 'package:kopa/resources/colors.dart';
import 'package:kopa/resources/fonts.dart';
import 'package:flutter/material.dart';

class CustomeTextField extends BaseStatefulWidget {
  final TextEditingController controller;
  final bool obscure;
  final String? hint;

  const CustomeTextField({
    Key? key,
    required this.controller,
    required this.obscure,
    required this.hint,
  }) : super(key: key);

  @override
  State<CustomeTextField> createState() => _CustomeTextFieldState();
}

class _CustomeTextFieldState extends State<CustomeTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscure,
        maxLength: 10,
        keyboardType: TextInputType.phone,
        style: AppFonts.size14.copyWith(
          color: AppColors.textWhite,
        ),
        decoration: InputDecoration(
          prefixText: widget.hint,
          labelText: widget.hint,
          contentPadding: const EdgeInsets.only(left: 30),
          prefixStyle: AppFonts.size14.copyWith(
            color: AppColors.textWhite,
          ),
          alignLabelWithHint: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelStyle: AppFonts.size14.copyWith(
            color: AppColors.textWhite,
          ),
          counterStyle: AppFonts.size12.copyWith(
            color: AppColors.background,
          ),
          // Focus border
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(
              color: AppColors.primary,
              width: 2,
            ),
          ),
          // Enable border
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(
              color: AppColors.input,
              width: 2,
            ),
          ),
          // // Error border
          // errorText: AppText.errorText,
          // errorStyle: AppFonts.size10.copyWith(color: AppColors.errorInput),
          // errorBorder: const OutlineInputBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(50)),
          //   borderSide: BorderSide(color: AppColors.errorInput, width: 2),
          // ),
        ),
      ),
    );
  }
}
