import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static const Color bgScaffoldDark = white;
  static const Color bgScaffold = white;

  static const Color bgCards = Color(0xFF1b1b1b);
  static const Color pinkSex = Color(0xFFDF2399);
  static const Color pinkSex2 = Color(0xFFc40340);
  static const Color purpleSex = Color(0xFF300b30);

  static const Color primary = Color(0xFFD00444);
  static const Color title = Color(0xFFFFFFFF);

  static const Color g1 = Color(0xFFF76F94);
  static const Color g2 = Color(0xFFF33C60);
  static const Color g3 = Color(0xFFF3B046);

  static const Color i1 = Color(0xFFE56600); // Alternativa de cor para i1
  static const Color i2 = Color(0xFFFEDD99); // Alternativa de cor para i2
  static const Color i3 = Color(0xFFC40050); // Alternativa de cor para i3
  static const Color i4 = Color(0xFF7D4BB0); // Alternativa de cor para i4
  static const Color i5 = Color(0xFF3D4EB5); // Alternativa de cor para i5

  // static const Color i1 = Color(0xFFF58529);
  // static const Color i2 = Color(0xFFFEDA77);
  // static const Color i3 = Color(0xFFDD2A7B);
  // static const Color i4 = Color(0xFF8134AF);
  // static const Color i5 = Color(0xFF515BD4);

  static const Color gradient1 = Color(0xFFE40303);
  static const Color gradient2 = Color(0xFFFF8C00);
  static const Color gradient3 = Color(0xFFFFED00);
  static const Color gradient4 = Color(0xFF008026);
  static const Color gradient5 = Color(0xFF24408E);
  static const Color gradient6 = Color(0xFF732982);

  static const Color primaryText = dark;
  //  static const Color primaryText = Color(0xFF1A1A1A);
  static const Color secundaryText = greyDarest;
  //  static const Color secundaryText = Color(0xFF666666);

  static const Color dark = Color(0xFF1A1A1A);
  static final Color dark72 = const Color(0xFF1A1A1A).withOpacity(0.72);
  static const Color greyDarest = Color(0xFF363636);
  static const Color greyDarker = Color(0xFF666666);
  static const Color greyDark = Color(0xFFABABAB);
  static const Color greyRegular = Color(0xFFC7C7C7);
  static const Color greyLight = Color(0xFFE6E6E6);
  static const Color greyLighteste = Color(0xFFF2F2F2);

  static const Color white = Color(0xFFFFFFFF);
  static const Color whiteBG = Color.fromRGBO(250, 250, 250, 0.987);
  static const Color whiteRegular = Color(0xFFF2F2F2);
  static final Color white75 = const Color(0xFFF2F2F2).withOpacity(0.75);
  static final Color white50 = const Color(0xFFF2F2F2).withOpacity(0.50);
  static final Color white25 = const Color(0xFFF2F2F2).withOpacity(0.25);

  static const Color success = Color(0xFF458723);
  static const Color successRegular = Color(0xFF63C132);
  static const Color successLight = Color(0xFFA1DA84);

  static const Color error = Color(0xFFA93422);
  static const Color errorRegular = Color(0xFFF24A30);
  static const Color errorLight = Color(0xFFF6806E);

  static const Color warningDark = Color.fromARGB(255, 179, 114, 60);
  static const Color warningRegular = Color(0xFFFFA256);
  static const Color warningLight = Color.fromARGB(255, 255, 208, 154);

  static String font1 = "Baloo2";
  static String font2 = "Dongle";

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: const TextTheme().apply(
      bodyColor: Colors.white,
      displayColor: Colors.blue,
    ),
    fontFamily: font1,
    scaffoldBackgroundColor: whiteBG,
    primaryTextTheme: const TextTheme(),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: bgCards),
    appBarTheme: const AppBarTheme(
        backgroundColor: whiteRegular,
        titleTextStyle: TextStyle(color: primaryText),
        iconTheme: IconThemeData(color: primaryText)),
    colorScheme: const ColorScheme.light(primary: primaryText),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: primaryText,
    ),
    buttonTheme: const ButtonThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16),
                topRight: Radius.circular(4),
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4)))),
  );

/*  //the dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    textTheme: const TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: whiteRegular,
      displayColor: Colors.blue,
    ),

    fontFamily: font1,
    scaffoldBackgroundColor: _darkBackgroundColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _darkPrimaryColor,
    ),
    appBarTheme: AppBarTheme(
        color: _darkBackgroundAppBarColor,
        iconTheme: IconThemeData(color: _lightAppBarIconColor),
        //textTheme: _lightTextTheme,
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 18)
    ),
    colorScheme: ColorScheme.dark(
      primary: _darkPrimaryColor,
      primaryVariant: _darkBackgroundColor,

      // secondary: _darkSecondaryColor,
    ),
    snackBarTheme: SnackBarThemeData(
        contentTextStyle: TextStyle(color: Colors.white),
        backgroundColor: _darkBackgroundAlertColor,
        actionTextColor: _darkBackgroundActionTextColor),
    iconTheme: IconThemeData(
      color: _darkIconColor, //_darkIconColor,
    ),
    popupMenuTheme: PopupMenuThemeData(color: _darkBackgroundAppBarColor),
    // textTheme: _darkTextTheme,
    buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        buttonColor: _darkPrimaryColor,
        textTheme: ButtonTextTheme.primary),
    unselectedWidgetColor: _darkPrimaryColor,
    inputDecorationTheme: InputDecorationTheme(
      prefixStyle: TextStyle(color: _darkIconColor),
      //labelStyle: TextStyle(color: nevada),
      border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          )),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _darkBorderColor, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _darkBorderActiveColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _darkBorderErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _darkBorderErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      fillColor: _darkInputFillColor,
      //focusColor: _darkBorderActiveColor,
    ),
  );*/
}



/* inputDecorationTheme: const InputDecorationTheme(


      contentPadding: EdgeInsets.only(left: 24,right: 24),
      counterStyle: TextStyle(
        color: primaryDarK
      ),
      hintStyle: TextStyle(
        color: primaryText
      ),
      suffixStyle: TextStyle(
          color: primaryText
      ),
      prefixStyle: TextStyle(color: primaryDarK),
      border:  OutlineInputBorder(
          borderSide: BorderSide(color: whiteRegular),
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(8),
          topRight: Radius.circular(2),
          topLeft:  Radius.circular(2), bottomLeft:  Radius.circular(2)
         )
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: whiteRegular),

          borderRadius: BorderRadius.only(bottomRight: Radius.circular(8),
              topRight: Radius.circular(2),
              topLeft:  Radius.circular(2), bottomLeft:  Radius.circular(2)
          )
      ),

      focusedBorder: UnderlineInputBorder(

          borderSide: BorderSide(color: primaryDarK),
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(8),
              topRight: Radius.circular(2),
              topLeft:  Radius.circular(2), bottomLeft:  Radius.circular(2)
          )
      ),
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: whiteRegular),
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(8),
              topRight: Radius.circular(2),
              topLeft:  Radius.circular(2), bottomLeft:  Radius.circular(2)
          )
      ),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: error),
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(8),
              topRight: Radius.circular(2),
              topLeft:  Radius.circular(2), bottomLeft:  Radius.circular(2)
          )
      ),
      focusedErrorBorder: OutlineInputBorder(

          borderRadius: BorderRadius.only(bottomRight: Radius.circular(8),
              topRight: Radius.circular(2),
              topLeft:  Radius.circular(2), bottomLeft:  Radius.circular(2)
          )
      ),
      fillColor: whiteRegular
    ),*/