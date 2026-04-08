import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';
import '../constants/size.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < kMinDesktopWidth;

    return Container(
      padding: const EdgeInsets.fromLTRB(0, 60, 0, 40),
      child: Column(
        children: [
          // Section header
          _sectionHeader("03.", "Contact", isMobile),
          const SizedBox(height: 30),

          // Content
          Column(
            children: [
              Text(
                "Get in touch",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 24 : 30,
                  color: CustomColor.whitePrimary,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 40),
                child: Text(
                  "Open to remote full-time and part-time Flutter roles globally.\nFeel free to reach out if you're looking for a developer, have a query, or simply want to connect.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.7,
                    color: CustomColor.greyText,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              InkWell(
                onTap: () async {
                  final uri = Uri.parse('mailto:aigbogungideon@gmail.com');
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: CustomColor.secondaryColor),
                  ),
                  child: Text(
                    "Say Hello",
                    style: GoogleFonts.firaCode().copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.secondaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 80),

          // Footer
          Text(
            "Built by Gideon Aigbogun\nwith Flutter Web",
            textAlign: TextAlign.center,
            style: GoogleFonts.firaCode().copyWith(
              fontWeight: FontWeight.w400,
              height: 1.8,
              fontSize: 12,
              color: CustomColor.hintDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(String number, String title, bool isMobile) {
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
}
