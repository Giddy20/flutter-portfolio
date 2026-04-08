import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../constants/size.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({
    super.key,
    this.isMobile = false,
    this.onContactTap,
    this.onExperienceTap,
  });

  final bool isMobile;
  final VoidCallback? onContactTap;
  final VoidCallback? onExperienceTap;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 4 : 20),
      height: screenHeight * 0.85,
      constraints: const BoxConstraints(minHeight: 400.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi, my name is",
            style: GoogleFonts.firaCode().copyWith(
              fontSize: isMobile ? 14 : 16,
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: CustomColor.secondaryColor,
            ),
          ),

          SizedBox(height: isMobile ? 12 : 20),

          Text(
            "Gideon Aigbogun.",
            style: robotoTextFont.copyWith(
              fontSize: isMobile ? 28 : 50,
              height: 1.2,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "I develop android and iOS mobile apps.",
            style: robotoTextFont.copyWith(
              fontSize: isMobile ? 22 : 38,
              height: 1.3,
              fontWeight: FontWeight.bold,
              color: CustomColor.greyText,
            ),
          ),

          SizedBox(height: isMobile ? 16 : 24),

          Text(
            "Flutter Engineer with 4+ years of hands-on experience building scalable, testable,\nand performant hybrid mobile applications using Flutter and Dart.",
            style: robotoTextFont.copyWith(
              fontSize: isMobile ? 14 : 16,
              height: 1.7,
              fontWeight: FontWeight.w400,
              color: CustomColor.greyText,
            ),
          ),

          SizedBox(height: isMobile ? 24 : 40),

          // CTA Buttons
          Wrap(
            spacing: 16,
            runSpacing: 12,
            children: [
              InkWell(
                onTap: onContactTap,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                    color: CustomColor.secondaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "▶ GET IN TOUCH",
                    style: GoogleFonts.firaCode().copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.primaryColor,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: onExperienceTap,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: CustomColor.whiteSecondary),
                  ),
                  child: Text(
                    "VIEW EXPERIENCE",
                    style: GoogleFonts.firaCode().copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.whiteSecondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
