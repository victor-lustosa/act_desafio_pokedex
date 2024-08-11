
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
        right: 19,
      ),
      child: FormFieldWidget(
        onChange: widget.onChange,
        fieldHeight: 48,
        fieldWidth: context.sizeOf.width,
        controller: widget.controller,
        fieldDecoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.cyan,
          ),
          borderRadius: BorderRadius.circular(11),
        ),
        isValid: isValid,
        validator: (value) => null,
        inputDecoration: InputDecoration(
          // suffixIcon: InkWell(
          //   onTap: () {
          //
          //   },
          //   child: IconButtonWidget(
          //     size: 28,
          //     color: Colors.black38,
          //     splashColor: Colors.transparent,
          //     highlightColor: Colors.transparent,
          //     iOSIcon: CupertinoIcons.search,
          //     androidIcon: Icons.search_sharp,
          //     action: widget.action,
          //   ),
          // ),
          border: InputBorder.none,
          hintStyle: AppFonts.defaultFont(
            fontSize: 12,
            color: Colors.black45,
          ),
          contentPadding: const EdgeInsets.only(
            left: 16,
          ),
          hintText: 'Digite o termo de pesquisa',
        ), colorStyle: AppColors.hintInputForm,
      ),
    );
  }
}