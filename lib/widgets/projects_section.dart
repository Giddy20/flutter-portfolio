import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gideon_aigbogun/constants/nav_items.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../constants/size.dart';
import '../utils/project_utils.dart';
import 'project_card.dart';

class ProjectsSection extends StatelessWidget {
   ProjectsSection({super.key});


  Rx<Color> menuColor = CustomColor.whitePrimary.obs;
  RxInt hoveredIndex = 5.obs;
  RxInt currentIndex = 0.obs;


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.8,
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Hobby projects title
              Row(
                children: [
                  const Text(
                    "Where I've worked",
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height() * 0.24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < projectTitles.length; i++)
                            Expanded(
                              child: Obx(() => Row(
                                children: [
                                  Container(
                                    width: 4,
                                    color: currentIndex.value == i
                                        ? CustomColor.secondaryColor
                                        : CustomColor.bgLight2,
                                  ),
                                  Center(
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: (){
                                        currentIndex.value = i;
                                      },
                                      onHover: (v){
                                        v == true ? hoveredIndex.value = i : hoveredIndex.value = 5;
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                                        decoration: BoxDecoration(
                                          color: hoveredIndex.value == i
                                              ? CustomColor.cardBg.withOpacity(0.3) : Colors.transparent,
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Text(projectTitles[i],
                                          style: GoogleFonts.firaCode().copyWith(
                                            fontSize: 12,
                                            height: 1.5,
                                            fontWeight: FontWeight.bold,
                                            color: hoveredIndex.value == i
                                                ? CustomColor.secondaryColor
                                                : CustomColor.whitePrimary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),)
                            ),

                      ],
                    ),
                  ),

                  horizontalSpace(0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Flutter Developer @ Intimid',
                        style: robotoTextFont.copyWith(
                          fontSize: 16,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary,
                        ),
                      ),

                      Text('Nov 2024 - Sept 2025',
                        style: GoogleFonts.firaCode().copyWith(
                          fontSize: 12,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.greyText,
                        ),
                      ),
                    ],
                  ),



                ],
              ),

            ],
          ),
    );
  }
}

