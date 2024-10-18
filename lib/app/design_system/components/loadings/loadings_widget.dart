import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../configs/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget(
      {super.key, this.androidRadius, this.color, this.size, this.iosRadius});

  final double? androidRadius;
  final double? iosRadius;
  final double? size;
  final Color? color;

  get androidIndicator => CircularProgressIndicator(
        strokeWidth: androidRadius!,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? AppColors.secondaryBlue,
        ),
      );

  @override
  Widget build(context) {
    return SizedBox(
      width: size,
      height: size,
      child: kIsWeb
          ? androidIndicator
          : Platform.isAndroid
              ? CircularProgressIndicator(
                  strokeWidth: androidRadius!,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    color ?? AppColors.secondaryBlue,
                  ),
                )
              : CupertinoActivityIndicator(
                  color: color ?? AppColors.secondaryBlue,
                  radius: iosRadius ?? 17,
                ),
    );
  }
}
