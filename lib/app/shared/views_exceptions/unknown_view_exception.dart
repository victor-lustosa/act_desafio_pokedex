import 'package:flutter/material.dart';

import '../../design_system/configs/app_colors.dart';
import '../../design_system/configs/app_fonts.dart';

class UnknownViewException extends StatefulWidget {
  const UnknownViewException({super.key});

  @override
  State<UnknownViewException> createState() => _UnknownViewExceptionState();
}

class _UnknownViewExceptionState extends State<UnknownViewException> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.85,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Icon(
              Icons.not_listed_location_outlined,
              size: 40,
              color: Colors.red,
            ),
          ),
          Center(
            child: Container(
              width: 226.31,
              margin: const EdgeInsets.only(top: 30, bottom: 59.8),
              child: Text(
                "Ops! Rota não encontrada.",
                style: AppFonts.defaultFont(
                  color: AppColors.grey12,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
