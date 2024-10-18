import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../configs/app_colors.dart';
import '../../configs/app_fonts.dart';
import '../../configs/app_images.dart';
import '../buttons/icon_button_widget.dart';

class TopBarElement {
  final String label;
  final Widget widget;

  TopBarElement({required this.label, required this.widget});
}

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key, required this.topBarLabels});

  final List<String> topBarLabels;

  @override
  Widget build(BuildContext context) {
    final List<TopBarElement> elements = [
      TopBarElement(
        label: 'backButton',
        widget: IconButtonWidget(
          size: 32,
          margin: EdgeInsets.zero,
          color: AppColors.darkBlue,
          iOSIcon: CupertinoIcons.chevron_back,
          androidIcon: Icons.arrow_back,
          action: (){
            Modular.to.pop(context);
          },
        ),
      ),
      TopBarElement(
        label: 'title',
        widget: Text(
          'Pokemons',
          style: AppFonts.defaultFont(
            fontSize: 20,
            color: AppColors.darkBlue,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      TopBarElement(
        label: 'logo',
        widget: Image.asset(
          width: 32,
          height: 32,
          AppImages.logoPokedex,
        ),
      )
    ];

    List<Widget> topBarList = [];
    for (String label in topBarLabels) {
      topBarList.add(elements.firstWhere((e) => e.label == label).widget);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: topBarList,
    );
  }
}
