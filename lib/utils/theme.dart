import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

const primaryColor = Color.fromRGBO(0, 92, 186, 1);
const successColor = Colors.green;
const Color warningColor = Color(0xFFffc107);
const Color dangerColor = Color(0xFFdc3545);
const Color hintColor = Color(0xFF6c757d);

final lightThemeData = ShadThemeData(
  brightness: Brightness.light,
  colorScheme: const ShadSlateColorScheme.light(
    background: Color.fromRGBO(250, 250, 250, 1), // HSL(0, 0%, 98%)
    foreground: Color.fromRGBO(13, 13, 13, 1), // HSL(240, 8%, 5%)
    card: Color.fromRGBO(250, 250, 250, 1), // Matches background
    cardForeground: Color.fromRGBO(13, 13, 13, 1), // Matches foreground
    popover: Color.fromRGBO(250, 250, 250, 1), // Matches background
    popoverForeground: Color.fromRGBO(13, 13, 13, 1), // Matches foreground
    primary: Color.fromRGBO(0, 92, 186, 1), // HSL(238, 86%, 29%)
    primaryForeground: Color.fromRGBO(250, 250, 250, 1), // HSL(0, 0%, 98%)
    secondary: Color.fromRGBO(240, 240, 240, 1), // HSL(240, 7%, 94%)
    secondaryForeground: Color.fromRGBO(13, 13, 13, 1), // Matches foreground
    muted: Color.fromRGBO(240, 240, 240, 1), // HSL(240, 7%, 94%)
    mutedForeground: Color.fromRGBO(115, 115, 115, 1), // HSL(240, 6%, 45%)
    accent: Color.fromRGBO(240, 240, 240, 1), // Matches muted
    accentForeground: Color.fromRGBO(13, 13, 13, 1), // Matches foreground
    destructive: Color.fromRGBO(255, 76, 76, 1), // HSL(0, 84%, 60%)
    destructiveForeground: Color.fromRGBO(250, 250, 250, 1), // HSL(0, 0%, 98%)
    border: Color.fromRGBO(232, 232, 232, 1), // HSL(240, 6%, 90%)
    input: Color.fromRGBO(212, 212, 212, 1), // HSL(240, 6%, 83%)
    ring: Color.fromRGBO(122, 158, 212, 1), // HSL(238, 24%, 75%)
  ),
  textTheme: ShadTextTheme.fromGoogleFont(
    GoogleFonts.robotoCondensed,
  ),
);

final darkThemeData = ShadThemeData(
  brightness: Brightness.dark,
  colorScheme: const ShadSlateColorScheme.dark(
    background: Color.fromRGBO(22, 22, 22, 1), // HSL(240, 7%, 8%)
    foreground: Color.fromRGBO(230, 230, 230, 1), // HSL(180, 9%, 98%)
    card: Color.fromRGBO(25, 25, 25, 1), // HSL(240, 6%, 10%)
    cardForeground: Color.fromRGBO(230, 230, 230, 1), // Matches foreground
    popover: Color.fromRGBO(25, 25, 25, 1), // Matches card
    popoverForeground: Color.fromRGBO(230, 230, 230, 1), // Matches foreground
    primary: Color.fromRGBO(0, 92, 186, 1), // HSL(238, 86%, 29%)
    primaryForeground: Color.fromRGBO(230, 230, 230, 1), // Matches foreground
    secondary: Color.fromRGBO(48, 48, 48, 1), // HSL(240, 8%, 19%)
    secondaryForeground: Color.fromRGBO(230, 230, 230, 1), // Matches foreground
    muted: Color.fromRGBO(74, 74, 74, 1), // HSL(240, 7%, 29%)
    mutedForeground: Color.fromRGBO(126, 126, 126, 1), // HSL(237, 8%, 49%)
    accent: Color.fromRGBO(31, 74, 132, 1), // HSL(238, 71%, 19%)
    accentForeground: Color.fromRGBO(230, 230, 230, 1), // Matches foreground
    destructive: Color.fromRGBO(255, 76, 76, 1), // HSL(0, 84%, 60%)
    destructiveForeground: Color.fromRGBO(250, 250, 250, 1), // HSL(0, 0%, 98%)
    border: Color.fromRGBO(30, 30, 30, 1), // HSL(240, 8%, 12%)
    input: Color.fromRGBO(45, 45, 45, 1), // HSL(240, 9%, 18%)
    ring: Color.fromRGBO(61, 119, 204, 1), // HSL(238, 86%, 40%)
  ),
  textTheme: ShadTextTheme.fromGoogleFont(
    GoogleFonts.robotoCondensed,
  ),
);
