
import 'dart:io';
import 'package:act_desafio_pokedex/app/core/configs/app_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget(
      {super.key, this.androidRadius, this.color, this.size, this.iosRadius});
  final double? androidRadius;
  final double? iosRadius;
  final double? size;
  final Color? color;

  @override
  Widget build(context) {
    return SizedBox(
      width: size ,
      height: size,
      child: Platform.isIOS
          ? CupertinoActivityIndicator(
        color: color ?? Colors.cyan,
        radius: iosRadius ?? 17,
      )
          : CircularProgressIndicator(
        strokeWidth: androidRadius!,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ??  Colors.cyan,
        ),
      ),
    );
  }
}
