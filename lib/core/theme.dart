import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontSize {
  static const small = 10.0;

  static const standard = 12.0;

  static const standardUp = 14.0;

  static const medium = 18.0;

  static const large = 25.0;

}

class DefaultColors {
  static const Color greyText = Color(0xFFB3B9C9);
  static const Color whiteText = Color(0xFFFFFFFF);
  static const Color senderMssage = Color(0xFF7AB194);
  static const Color recieverMessage = Color(0xFF373E4E);
  static const Color sentMessageInput = Color(0xFF3D4354);
  static const Color messageListPage = Color(0xFF292F3F);
  static const Color buttonColor = Color(0xFF7AB194);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Color(0xFF182020),
      textTheme: TextTheme(
        titleMedium: GoogleFonts.aclonica(
          fontSize: FontSize.medium,
          color: Colors.white
        ),
        titleLarge: GoogleFonts.aclonica(
          fontSize: FontSize.large,
          color: Colors.white
        ),

        bodySmall: GoogleFonts.aclonica(
          fontSize: FontSize.standardUp,
          color: Colors.white
        ),

        bodyMedium: GoogleFonts.aclonica(
          fontSize: FontSize.standard,
          color: Colors.white
        ),

        bodyLarge: GoogleFonts.aclonica(
          fontSize: FontSize.standardUp,
          color: Colors.white
        ),
      )
    );
  }
}