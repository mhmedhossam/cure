import 'package:flutter/material.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';

class CustomTextForm extends StatefulWidget {
  const CustomTextForm({
    super.key,
    this.validator,
    required this.hint,
    this.isPassword = false,
    this.controller,
    this.edgeInsets,
    this.suffix,
    this.prefix,
    this.readonly,
    this.keyboardType,
    this.onTap,
    this.onSubmit,
    this.onChanged,
    this.fillColor,
  });

  final String? Function(String?)? validator;
  final String hint;
  final bool isPassword;
  final TextEditingController? controller;
  final EdgeInsets? edgeInsets;
  final Widget? suffix;
  final Widget? prefix;
  final bool? readonly;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final void Function(String)? onSubmit;
  final void Function(String)? onChanged;
  final Color? fillColor;
  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onFieldSubmitted: widget.onSubmit,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      readOnly: widget.readonly ?? false,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        fillColor: widget.fillColor ?? AppColors.textFormColor,
        filled: true,
        contentPadding: widget.edgeInsets,
        prefixIcon: widget.prefix,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.primaryColor,
                ),
              )
            : widget.suffix,
        hint: Text(widget.hint, style: TextStyles.details),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.whiteColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
