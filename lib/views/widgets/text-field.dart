import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peanut_app_task/app/theme.dart';

import '../../app/constatns/app_size.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    required this.keyboarType,
  });
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final TextInputType keyboarType;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      decoration: BoxDecoration(
          color: AppTheme.bgColor,
          borderRadius: BorderRadius.circular(AppSize.s10)),
      controller: controller,
      prefix: Padding(
        padding: const EdgeInsets.only(left: AppSize.s10),
        child: Icon(icon),
      ),
      placeholder: hint,
      keyboardType: TextInputType.number,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSize.s10, vertical: AppSize.s10),
    );
  }
}
