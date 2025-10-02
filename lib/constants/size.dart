import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gideon_aigbogun/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

const double kMinDesktopWidth = 600.0;
const double kMedDesktopWidth = 800.0;

smallHSpace() => const SizedBox(width: 20);
tinyHSpace() => const SizedBox(width: 10);
smallSpace() => const SizedBox(height: 20);
tinySpace() => const SizedBox(height: 10);
tiny15Space() => const SizedBox(height: 15);
tiny5Space() => const SizedBox(height: 5);
tinyH5Space() => const SizedBox(width: 5);
mediumSpace() => const SizedBox(height: 30);
mediumHSpace() => const SizedBox(width: 30);


double height() => Get.height;
double width() => Get.width;

Widget kSpacing =  const SizedBox(height: 10,);
Widget kLargeSpacing =  const SizedBox(height: 30,);

verticalSpace(factor) => SizedBox(height: height() * factor);
horizontalSpace(factor) => SizedBox(width: width() * factor);


TextStyle robotoTextFont = GoogleFonts.roboto(
    fontSize: 15.sp,
    color: CustomColor.primaryColor,
);