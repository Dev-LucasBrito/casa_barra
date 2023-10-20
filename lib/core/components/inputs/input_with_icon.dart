import 'package:app_votacao/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormInputFieldWithIcon extends StatelessWidget {
  const FormInputFieldWithIcon(
      {Key? key,
      required this.controller,
      required this.iconPrefix,
      required this.labelText,
      required this.validator,
      this.clearIconSuffix = true,
      this.keyboardType = TextInputType.text,
      this.textInputAction,
      this.focusNode,
      this.obscureText = false,
      this.enabled = true,
      this.readOnly = false,
      this.minLines = 1,
      this.maxLines,
      this.inputFormatters,
      required this.onChanged,
      required this.onSaved,
      this.onEditingComplete,
      this.hasNewIcon = false,
      this.onFieldSubmitted,
      this.styleMain = const TextStyle(
        color: AppThemes.secundaryText,
      ),
      this.sizeIcon = 21,
      this.paddingIcon = 0,
      this.inputBorder,
      this.newIcon = Icons.abc,
      this.iconFunction,
      this.enabledBorder,
      this.focusedBorder,
      this.autofocus = false, this.onTap})
      : super(key: key);

  final TextEditingController controller;
  final IconData? iconPrefix;
  final TextStyle? styleMain;
  final bool clearIconSuffix;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int minLines;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String) onChanged;
  final void Function(String?)? onSaved;
  final VoidCallback? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final InputBorder? inputBorder;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final bool autofocus;
  final bool hasNewIcon;
  final double? sizeIcon;
  final double? paddingIcon;
  final IconData? newIcon;
  final Function()? iconFunction;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        onTap: onTap,
        cursorColor: AppThemes.pinkSex,
        style: styleMain,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(0, 38, 38, 38),
          iconColor: AppThemes.secundaryText,
          prefixIconColor: AppThemes.secundaryText,
          suffixIconColor: AppThemes.secundaryText,
          focusColor: AppThemes.secundaryText,
          border: inputBorder,
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppThemes.error),
          ),
          disabledBorder: inputBorder,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppThemes.secundaryText),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppThemes.secundaryText),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(top: paddingIcon!),
            child: Icon(
              iconPrefix,
              size: sizeIcon,
              color: const Color.fromARGB(255, 139, 139, 139),
            ),
          ),
          floatingLabelStyle:
              const TextStyle(fontSize: 15, color: AppThemes.secundaryText),
          labelText: labelText,
          labelStyle: const TextStyle(color: AppThemes.secundaryText),
          suffixIcon: hasNewIcon
              ? IconButton(
                  icon: Icon(newIcon, size: 21),
                  onPressed: iconFunction,
                  color: const Color.fromARGB(255, 139, 139, 139),
                )
              : clearIconSuffix
                  ? IconButton(
                      icon: const Icon(
                        Icons.clear,
                        size: 21,
                        color: Color.fromARGB(255, 139, 139, 139),
                      ),
                      onPressed: () {
                        controller.clear();
                      },
                    )
                  : null,
        ),
        autofocus: autofocus,
        controller: controller,
        onSaved: onSaved,
        onChanged: onChanged,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLines: maxLines,
        inputFormatters: inputFormatters,
        minLines: minLines,
        validator: validator,
        enabled: enabled,
        textInputAction: textInputAction,
        focusNode: focusNode,
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: onFieldSubmitted,
        readOnly: readOnly,
      ),
    );
  }
}

class FormInputFieldWithOutController extends StatelessWidget {
  const FormInputFieldWithOutController(
      {Key? key,
      required this.iconPrefix,
      required this.labelText,
      required this.validator,
      this.initialValue,
      this.clearIconSuffix = true,
      this.keyboardType = TextInputType.text,
      this.textInputAction,
      this.focusNode,
      this.obscureText = false,
      this.enabled = true,
      this.readOnly = false,
      this.minLines = 1,
      this.maxLines,
      this.inputFormatters,
      required this.onChanged,
      required this.onSaved,
      this.onEditingComplete,
      this.hasNewIcon = false,
      this.onFieldSubmitted,
      this.styleMain = const TextStyle(
        color: AppThemes.secundaryText,
      ),
      
      this.sizeIcon = 21,
      this.paddingIcon = 0,
      this.inputBorder,
      this.newIcon = Icons.abc,
      this.iconFunction,
      this.enabledBorder,
      this.focusedBorder,
      required this.controller,
      this.autofocus = false})
      : super(key: key);

  final IconData? iconPrefix;
  final TextStyle? styleMain;
  final bool clearIconSuffix;
  final String labelText;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int minLines;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String) onChanged;
  final void Function(String?)? onSaved;
  final VoidCallback? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final InputBorder? inputBorder;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final bool autofocus;
  final bool hasNewIcon;
  final double? sizeIcon;
  final double? paddingIcon;
  final IconData? newIcon;
  final Function()? iconFunction;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        cursorColor: AppThemes.pinkSex,
        style: styleMain,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(0, 38, 38, 38),
          iconColor: AppThemes.secundaryText,
          prefixIconColor: AppThemes.secundaryText,
          suffixIconColor: AppThemes.secundaryText,
          focusColor: AppThemes.secundaryText,
          border: inputBorder,
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppThemes.error),
          ),
          disabledBorder: inputBorder,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppThemes.secundaryText),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppThemes.secundaryText),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(top: paddingIcon!),
            child: Icon(
              iconPrefix,
              size: sizeIcon,
              color: const Color.fromARGB(255, 139, 139, 139),
            ),
          ),
          floatingLabelStyle:
              const TextStyle(fontSize: 15, color: AppThemes.secundaryText),
          labelText: labelText,
          labelStyle: const TextStyle(color: AppThemes.secundaryText),
        ),
        autofocus: autofocus,
        onSaved: onSaved,
        onChanged: onChanged,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLines: maxLines,
        inputFormatters: inputFormatters,
        minLines: minLines,
        validator: validator,
        enabled: enabled,
        textInputAction: textInputAction,
        focusNode: focusNode,
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: onFieldSubmitted,
        readOnly: readOnly,
      ),
    );
  }
}
