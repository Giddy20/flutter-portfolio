import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../constants/size.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      height: screenHeight / 1,
      width: width(),
      constraints: const BoxConstraints(
        minHeight: 350.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
              "Hi, my name is",
              style: GoogleFonts.firaCode().copyWith(
                fontSize: 16,
                height: 1.5,
                fontWeight: FontWeight.bold,
                color: CustomColor.secondaryColor,
              )
          ),

          verticalSpace(0.04),

          Text(
              "Gideon Aigbogun",
              style: robotoTextFont.copyWith(
                fontSize: 38,
                height: 1.5,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary,
              )
          ),

          verticalSpace(0.01),

          Text(
              "I develop android and iOS mobile apps",
              style: robotoTextFont.copyWith(
                fontSize: 38,
                height: 1.5,
                fontWeight: FontWeight.bold,
                color: CustomColor.greyText,
              ),
          ),

          verticalSpace(0.03),

          Text(
              "Flutter Engineer with 4+ years of hands-on experience building scalable, testable,\nand"
                  " performant hybrid mobile applications using Flutter and Dart",
              style: robotoTextFont.copyWith(
                fontSize: 16,
                height: 1.5,
                fontWeight: FontWeight.bold,
                color: CustomColor.greyText,
              )
          ),
        ],
      )
    );
  }
}