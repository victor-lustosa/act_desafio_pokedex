import 'package:flutter/material.dart';

import '../../design_system/configs/app_fonts.dart';

class DefaultErrorMessageException extends StatelessWidget {
  const DefaultErrorMessageException({super.key, required this.message, this.color});
  final String message;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 100),
        width: 250,
        child: Text(
          message,
          style: AppFonts.defaultFont(color: color ?? Colors.red),
        ),
      ),
    );
  }
}
