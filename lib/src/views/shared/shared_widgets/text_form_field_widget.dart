import 'package:ems/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {Key? key,
        required this.controller,
        required this.validate,
        this.isSecure = false,
        this.isUnderlined = false,
        this.readOnly = false,
        this.filled = false,
        this.keyboardType = TextInputType.text,
        this.maxLines = 1,
        this.color = Colors.grey,
        this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        this.onChanged,
        this.onTap,
        this.prefixButton,
        this.prefix,
        this.prefixIcon,
        this.suffixButton,
        this.suffix,
        this.suffixIcon,
        this.label,
        this.hint})
      : super(key: key);
  final TextEditingController controller;
  final String? Function(String?) validate;
  final bool isSecure;
  final bool filled;
  final bool isUnderlined;
  final bool readOnly;
  final TextInputType keyboardType;
  final int maxLines;
  final Color color;
  final EdgeInsetsGeometry padding;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final bool? prefixButton;
  final bool? suffixButton;
  final Widget? prefix;
  final Widget? suffix;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? label;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validate,
      obscureText: isSecure,
      keyboardType: keyboardType,
      readOnly: readOnly,
      onChanged: onChanged,
      onTap: onTap,
      maxLines: maxLines,
      cursorColor: AppColors.mainClr,
      style: TextStyle(
        color: AppColors.mainClr,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        contentPadding: padding,
        filled: filled,
        fillColor: color,
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColors.greyClr,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
        label: label != null ? Text(label!) : null,
        labelStyle: TextStyle(
          color: AppColors.greyClr,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
        errorStyle: TextStyle(
          color: Colors.redAccent.shade200,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'GemunuLibre'
        ),
        prefixIcon: prefixButton == true
            ? prefix
            : prefixButton == false
            ? Icon(
          prefixIcon,
          size: 22.sp,
          color: AppColors.greyClr,
        )
            : null,
        prefixIconColor: AppColors.greyClr,
        suffixIcon: suffixButton == true
            ? suffix
            : suffixButton == false
            ? Icon(
          suffixIcon,
          size: 22.sp,
          color: AppColors.greyClr,
        )
            : null,
        suffixIconColor: AppColors.greyClr,
        border: isUnderlined ? _underlineBorder() : _outlineBorder(),
        enabledBorder: isUnderlined ? _underlineBorder() : _outlineBorder(),
        errorBorder: isUnderlined ? _underlineBorder() : _outlineBorder(),
        focusedBorder: isUnderlined ? _underlineBorder() : _outlineBorder(),
        focusedErrorBorder:
        isUnderlined ? _underlineBorder() : _outlineBorder(),
      ),
    );
  }

  OutlineInputBorder _outlineBorder() =>  OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(8),
    ),
    borderSide: BorderSide(
      color: AppColors.greyClr,
      width: 1.5,
    ),
  );

  UnderlineInputBorder _underlineBorder() => const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
      width: 1,
    ),
  );

  String? _validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your value...!';
    } else {
      return null;
    }
  }
}