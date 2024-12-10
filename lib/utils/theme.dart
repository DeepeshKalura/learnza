import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFF0077b6);
const Color secondaryColor = Color(0xFFFECFC4);
const Color successColor = Color(0xFF28a745);
const Color warningColor = Color(0xFFffc107);
const Color dangerColor = Color(0xFFdc3545);
const Color hintColor = Color(0xFF6c757d);
const Color darkPrimaryColor = Color(0xFF120071);

final lightThemData = ShadThemeData(
  brightness: Brightness.light,
  colorScheme: const ShadSlateColorScheme.light(
    primary: primaryColor,
    destructive: dangerColor,
  ),
  textTheme: ShadTextTheme.fromGoogleFont(
    GoogleFonts.roboto,
  ),
  primaryButtonTheme: const ShadButtonTheme(
    backgroundColor: primaryColor,
  ),
);

final darkThemData = ShadThemeData(
  brightness: Brightness.dark,
  colorScheme: const ShadSlateColorScheme.dark(
    primary: primaryColor,
    destructive: dangerColor,
  ),
  textTheme: ShadTextTheme.fromGoogleFont(
    GoogleFonts.roboto,
  ),
);
