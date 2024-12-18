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
  colorScheme: ShadSlateColorScheme.light(
    background: Colors.white,
    foreground: Colors.grey[900] ?? Colors.black,
    card: Colors.white,
    popover: Colors.white,
    popoverForeground: Colors.grey[900] ?? Colors.black,
    cardForeground: Colors.grey[900] ?? Colors.black,
    primary: const Color(0xff2074AC),
    primaryForeground: const Color(0xFF2892D7),
    secondary: const Color(0xffF9E0DC),
    secondaryForeground: const Color(0xFFEB9486),
    destructive: const Color(0xFFdc3545),
    accent: const Color(0xffFDFAED),
    accentForeground: const Color(0xFFCAA916),
    destructiveForeground: Colors.grey[50] ?? Colors.blueGrey,
    border: Colors.grey[200] ?? Colors.grey,
    input: Colors.grey[200] ?? Colors.grey,
    ring: const Color(0xff2074AC),
    muted: Colors.grey[100] ?? Colors.grey,
    mutedForeground: Colors.grey,
  ),
  textTheme: ShadTextTheme.fromGoogleFont(
    GoogleFonts.roboto,
  ),
);

final darkThemData = ShadThemeData(
  brightness: Brightness.dark,
  colorScheme: ShadSlateColorScheme.dark(
    background: Colors.grey[900] ?? Colors.black,
    foreground: Colors.grey[50] ?? Colors.blueGrey,
    card: Colors.grey[900] ?? Colors.black,
    popover: Colors.grey[900] ?? Colors.black,
    popoverForeground: Colors.grey[50] ?? Colors.blueGrey,
    primary: const Color(0xff2074AC),
    primaryForeground: const Color.fromARGB(255, 165, 219, 255),
    secondary: const Color(0xFF9E2B1A),
    secondaryForeground: const Color(0xffF9E0DC),
    muted: Colors.grey[800] ?? Colors.grey,
    mutedForeground: Colors.grey,
    accent: const Color(0xFFCAA916),
    accentForeground: const Color(0xffFDFAED),
    destructive: const Color.fromARGB(255, 224, 5, 27),
    destructiveForeground: Colors.grey[50] ?? Colors.blueGrey,
    border: Colors.grey[800] ?? Colors.grey,
    input: Colors.grey[800] ?? Colors.grey,
    ring: const Color(0xff2074AC),
  ),
  textTheme: ShadTextTheme.fromGoogleFont(
    GoogleFonts.roboto,
  ),
);
