import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color blackColor = const Color(0xff201F25);
Color blackTransparentColor = const Color(0xff201F25).withOpacity(0.25);
Color greenColor = const Color(0xff679436);
Color greenTransparentColor = const Color(0xff00B074).withOpacity(0.15);
Color whiteColor = const Color(0xffEBF2FA);
Color redColor = const Color(0xffFF5B5B);
Color redTransparentColor = const Color(0xffFF5B5B).withOpacity(0.15);
Color greyColor = const Color(0xffD9D9D9);
Color darkBlueColor = const Color(0xff05668D);
Color blueColor = const Color(0xff427AA1);

TextStyle blackTS = GoogleFonts.inter(
  color: blackColor,
);
TextStyle whiteTS = GoogleFonts.inter(
  color: whiteColor,
);
TextStyle greenTS = GoogleFonts.inter(
  color: greenColor,
);
TextStyle redTS = GoogleFonts.inter(
  color: redColor,
);
TextStyle greyTS = GoogleFonts.inter(
  color: greyColor,
);
TextStyle darkBlueTS = GoogleFonts.inter(
  color: darkBlueColor,
);

FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
