
import 'package:flutter/material.dart';

class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget(
      {super.key,
        required this.action,
        this.iconColor,
        this.icon,
        required this.backgroundColor,
        this.size,
        this.pngIcon, this.heroTag,});

  final VoidCallback action;
  final Color? iconColor;
  final Color backgroundColor;
  final IconData? icon;
  final String? pngIcon;
  final String? heroTag;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: 56,
      child: FloatingActionButton(
        heroTag: heroTag,
        shape: const CircleBorder(),
        elevation: 3,
        highlightElevation: 1.8,
        focusElevation: 1.8,
        hoverElevation: 1.8,
        onPressed: action,
        backgroundColor: backgroundColor,
        child: icon != null
            ? Icon(
          size: size ?? 45,
          icon,
          color: iconColor,
        )
            : SizedBox(
          height: size,
          width: size,
          child: Image.asset(
            pngIcon ?? '',
          ),
        ),
      ),
    );
  }
}