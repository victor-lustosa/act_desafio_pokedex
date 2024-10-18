import 'package:act_desafio_pokedex/app/core/configs/app_configs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../configs/app_colors.dart';
import '../../configs/app_fonts.dart';
import '../buttons/icon_button_widget.dart';
import '../forms/form_field_widget.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget(
      {super.key,
      this.controller,
      this.searchAction,
      this.onChange,
      this.cleanAction});

  final TextEditingController? controller;
  final void Function()? searchAction;
  final void Function()? cleanAction;
  final void Function(String)? onChange;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 24,
        bottom: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: context.sizeOf.width * .74,
            child: FormFieldWidget(
              fieldHeight: 40,
              onChange: widget.onChange,
              fieldWidth: context.sizeOf.width,
              controller: widget.controller,
              cursorColor: AppColors.lightBlue,
              fieldDecoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1.5,
                  color: AppColors.lightBlue,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              isValid: isValid,
              validator: (value) => null,
              inputDecoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: AppFonts.defaultFont(
                  fontSize: 14,
                  color: AppColors.lightBlue,
                ),
                contentPadding: const EdgeInsets.only(
                  left: 16,
                  bottom: 14,
                ),
                suffixIconConstraints: BoxConstraints(
                  minHeight: 24,
                  minWidth: 24,
                ),
                hintText: 'Digite o nome de um pokemon',
                suffixIcon: IconButtonWidget(
                  margin: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  size: 24,
                  color: AppColors.darkBlue,
                  iOSIcon: CupertinoIcons.clear,
                  androidIcon: Icons.close_rounded,
                  action: widget.cleanAction,
                ),
              ),
              colorStyle: AppColors.darkBlue,
            ),
          ),
          InkWell(
            onTap: widget.searchAction,
            child: IconButtonWidget(
              size: 40,
              sizeIcon: 24,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(
                    width: 1.5,
                    color: AppColors.lightBlue,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              color: AppColors.darkBlue,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              iOSIcon: CupertinoIcons.search,
              androidIcon: Icons.search_sharp,
              action: widget.searchAction,
            ),
          ),
        ],
      ),
    );
  }
}
