
import 'package:act_desafio_pokedex/app/core/configs/app_configs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../configs/app_colors.dart';
import '../../configs/app_fonts.dart';
import '../buttons/icon_button_widget.dart';
import '../forms/form_field_widget.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget(
      {super.key, required this.controller,  this.action, this.onChange});

  final TextEditingController controller;
  final void Function()? action;
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
        left: 16,
        right: 16,
        bottom: 5
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: context.sizeOf.width * .74,
            child: FormFieldWidget(
              fieldHeight: 48,
              onChange: widget.onChange,
              fieldWidth: context.sizeOf.width,
              controller: widget.controller,
              fieldDecoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1.5,
                  color: Colors.cyan,
                ),
                borderRadius: BorderRadius.circular(11),
              ),
              isValid: isValid,
              validator: (value) => null,
              inputDecoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: AppFonts.defaultFont(
                  fontSize: 12,
                  color: Colors.black45,
                ),
                contentPadding: const EdgeInsets.only(
                  left: 16,
                  bottom: 3
                ),
                hintText: 'Digite o nome de um pokemon',
              ), colorStyle: AppColors.hintInputForm,
            ),
          ),
          InkWell(
            onTap: widget.action,
            child: IconButtonWidget(
              size: 48,
              sizeIcon: 24,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                  color: Colors.cyan,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20))
            ),
              color: Colors.black38,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              iOSIcon: CupertinoIcons.search,
              androidIcon: Icons.search_sharp,
              action: widget.action,
            ),
          ),
        ],
      ),
    );
  }
}