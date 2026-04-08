import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../constants/size.dart';

class AboutDesktop extends StatelessWidget {
  const AboutDesktop({super.key, this.isMobile = false});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 4 : 20),
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          _sectionHeader("01.", "About Me"),
          const SizedBox(height: 30),

          // Content: side-by-side on desktop, stacked on mobile
          if (isMobile) ...[
            _buildBioText(),
            const SizedBox(height: 24),
            _buildSkills(),
            const SizedBox(height: 30),
            Center(child: _buildPhoto(screenWidth * 0.45)),
          ] else ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text + skills
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildBioText(),
                      const SizedBox(height: 20),
                      _buildSkills(),
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                // Photo
                _buildPhoto(screenWidth * 0.16),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _sectionHeader(String number, String title) {
    return Row(
      children: [
        Text(
          number,
          style: GoogleFonts.firaCode().copyWith(
            fontSize: isMobile ? 18 : 22,
            fontWeight: FontWeight.bold,
            color: CustomColor.secondaryColor,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: isMobile ? 22 : 30,
            fontWeight: FontWeight.bold,
            color: CustomColor.whitePrimary,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Divider(
            thickness: 1,
            color: CustomColor.bgLight2.withOpacity(0.5),
          ),
        ),
      ],
    );
  }

  Widget _buildBioText() {
    return AutoSizeText(
      "Flutter Engineer with 4+ years of hands-on experience building scalable, testable, and "
      "performant hybrid mobile applications using Flutter and Dart. Adept at collaborating in distributed "
      "agile teams, taking full ownership of complex codebases, and mentoring junior developers. Strong "
      "background in Clean Architecture, modular design, RESTful APIs, native Android/iOS integration, and "
      "CI/CD pipelines.\n\nExperienced in feature flagging, remote configuration, and production monitoring. "
      "Passionate about code quality, developer experience, and continuous improvement.",
      maxFontSize: 15,
      minFontSize: 12,
      style: robotoTextFont.copyWith(
        fontSize: 15,
        height: 1.7,
        fontWeight: FontWeight.w300,
        color: CustomColor.greyText,
      ),
    );
  }

  Widget _buildSkills() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _toolsWidget('Flutter'),
            _toolsWidget('Git'),
            _toolsWidget('Firebase'),
          ],
        ),
        const SizedBox(width: 40),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _toolsWidget('Rest API'),
            _toolsWidget('Figma'),
            _toolsWidget('Postman'),
          ],
        ),
      ],
    );
  }

  Widget _buildPhoto(double size) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: CustomColor.secondaryColor, width: 1),
          ),
        ),
        Positioned(
          top: -16,
          left: -16,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: const AssetImage("assets/images/gideon_main.jpg"),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _toolsWidget(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.double_arrow,
            color: CustomColor.secondaryColor,
            size: 12,
          ),
          const SizedBox(width: 8),
          Text(
            name,
            style: GoogleFonts.firaCode().copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: CustomColor.greyText,
            ),
          ),
        ],
      ),
    );
  }
}
