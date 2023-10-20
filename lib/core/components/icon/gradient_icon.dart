import 'package:app_votacao/core/themes/app_themes.dart';
import 'package:flutter/material.dart';

class AppGradientIcon extends StatelessWidget {
  const AppGradientIcon(this.icon, this.size, this.selected, this.sizeContainer,
      {super.key});

  final IconData icon;
  final double size;
  final double sizeContainer;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizeContainer,
      child: ShaderMask(
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
        shaderCallback: (Rect bounds) {
          final Rect rect = Rect.fromLTRB(0, 0, size, 0);
          return LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: selected
                ? [
                    AppThemes.i1,
                    AppThemes.i1,
                    AppThemes.i3,
                    AppThemes.i4,
                    AppThemes.i5,
                    AppThemes.i5
                  ]
                : [AppThemes.dark, AppThemes.dark],
          ).createShader(rect);
        },
      ),
    );
  }
}
