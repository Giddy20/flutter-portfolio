import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../constants/size.dart';

class AboutDesktop extends StatelessWidget {
  const AboutDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      height: screenHeight * 0.8,
      constraints: const BoxConstraints(
        minHeight: 350.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // intro message
              Row(
                children: [
                  const Text(
                    "About Me",
                    style: TextStyle(
                      fontSize: 35,
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                 horizontalSpace(0.02),
                  SizedBox(
                    width: width() * 0.08,
                    child: Divider(
                      thickness: 1.5,
                    ),
                  )
                ],
              ),

              verticalSpace(0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // intro message
                      const SizedBox(height: 15),
                      SizedBox(
                        width: width() * 0.4,
                        child:  AutoSizeText(
                          maxFontSize: 15,
                          "Flutter Engineer with 4+ years of hands-on experience building scalable, testable, and"
                              "performant hybrid mobile applications using Flutter and Dart. Adept at collaborating in distributed"
                              "agile teams, taking full ownership of complex codebases, and mentoring junior developers. Strong"
                              "background in Clean Architecture, modular design, RESTful APIs, native Android/iOS integration, and"
                              "CI/CD pipelines.\n\nExperienced in feature flagging, remote configuration, and production monitoring."
                              "Passionate about code quality, developer experience, and continuous improvement",
                          style: robotoTextFont.copyWith(
                            fontSize: 5.4.sp,
                            height: 1.5,
                            fontWeight: FontWeight.w100,
                            color: CustomColor.greyText,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // contact btn
                     Row(
                       children: [
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             toolsWidget('Flutter'),
                             toolsWidget('Git'),
                             toolsWidget('Firebase'),
                           ],
                         ),
                         horizontalSpace(0.03),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             toolsWidget('Rest API'),
                             toolsWidget('Figma'),
                             toolsWidget('Postman'),
                           ],
                         )
                       ],
                     ),

                    ],
                  ),
                  // avatar img
                  horizontalSpace(0.05),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [

                      Container(
                        width: width() * 0.18,
                        height: width() * 0.18,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: CustomColor.secondaryColor, width: 1)
                        ),
                      ),


                      Positioned(
                        top: -22,
                        left: -22,
                        child: Container(
                          width: width() * 0.18,
                          height: width() * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(image: Image.asset(
                              "assets/images/gideon_main.jpg", height: width() * 0.2,
                            ).image, fit: BoxFit.cover,  alignment: Alignment.topCenter,),
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
        ])
          // avatar img
        ],
      ),
    );
  }
}

Widget toolsWidget(name){
  return Padding(
    padding: const EdgeInsets.all(2),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.double_arrow, color: CustomColor.secondaryColor, size: 12),
        tinyHSpace(),
        Text(name,
          style: GoogleFonts.firaCode().copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: CustomColor.greyText,
          ),),
      ],
    ),
  );
}