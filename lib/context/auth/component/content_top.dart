import 'package:app_votacao/core/components/text/text.dart';
import 'package:app_votacao/core/themes/app_themes.dart';
import 'package:flutter/material.dart';

class ContentTopRecoveryPassword extends StatelessWidget {
  final String title;
  final String text;

  const ContentTopRecoveryPassword({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 21),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AppText.textPrimary(
                text: title,
                color: AppThemes.primaryText,
                fontSize: 18,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 280,
                child: AppText.textSecundary(
                  text: text,
                  color: AppThemes.secundaryText,
                  fontSize: 14,
                  textAlign: TextAlign.start,
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
