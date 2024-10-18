import 'package:flutter/material.dart';

import '../../design_system/configs/app_colors.dart';
import '../../design_system/configs/app_fonts.dart';
import '../../design_system/configs/app_images.dart';

class SearchNotFoundWidget extends StatelessWidget {
  const SearchNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          left: 40,
          right: 40,
          top: 96,
        ),
        child: Column(
          children: [
            RichText(
              textAlign:TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Não foi encontrado nenhum pokemon com esse nome! ',
                    style: AppFonts.defaultFont(
                      height: 1.5,
                      fontSize: 14,
                      color: AppColors.secondaryBlue,
                    ),
                  ),
                  TextSpan(
                    text: 'Pesquise novamente 👊',
                    style: AppFonts.defaultFont(
                      height: 1.5,
                      fontSize: 14,
                      color: AppColors.secondaryBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Image.asset(
                width: 154,
                height: 147,
                AppImages.searchNotFound,
              ),
            )
          ],
        ),
      ),
    );
  }
}
