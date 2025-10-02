import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../constants/links.dart';
import '../constants/size.dart';
import 'custom_text_field.dart';
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 40),
      height: screenHeight * 0.65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Get in touch",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: CustomColor.whitePrimary,
                ),
              ),
              verticalSpace(0.03),
              const Text(
                "What’s next? Feel free to reach out to me if you're looking for a developer,\nhave a query, or simply want to connect.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: CustomColor.greyText,
                ),
              ),

              const SizedBox(height: 50),


              InkWell(
                onHover: (v){

                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: CustomColor.secondaryColor)
                  ),
                  child: Text("Get in Touch",
                    style: GoogleFonts.firaCode().copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.secondaryColor,
                    ),
                  ),
                ),
              ),


            ],
          ),

          Text("Built by Gideon Aigbogun\nwith Flutter Web",
            textAlign: TextAlign.center,
            style: GoogleFonts.firaCode().copyWith(
              fontWeight: FontWeight.bold,height: 1.8,
              fontSize: 12,
              color: CustomColor.hintDark,
            ),
          ),
        ],
      ),
    );
  }

}