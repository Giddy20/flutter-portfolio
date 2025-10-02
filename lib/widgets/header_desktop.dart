import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../constants/nav_items.dart';
import '../constants/size.dart';

class HeaderDesktop extends StatelessWidget {
  HeaderDesktop({
    super.key,
    required this.onNavMenuTap,
  });
  final Function(int) onNavMenuTap;

  Rx<Color> menuColor = CustomColor.whitePrimary.obs;
  RxInt hoveredIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      color: CustomColor.primaryColor,
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text("G",
              style: robotoTextFont.copyWith(
                fontSize: 46,
                fontWeight: FontWeight.w500,
                color: CustomColor.secondaryColor,
              ),),
          ),
          Row(
            children: [
              Obx(() => Row(
                children: [
                  for (int i = 0; i < navTitles.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: InkWell(
                        onTap: (){
                          onNavMenuTap(i);
                        },
                        onHover: (v){
                          hoveredIndex.value = i;
                        },
                        child: Text(
                          navTitles[i],
                          style: GoogleFonts.firaCode().copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: hoveredIndex.value == i
                                ? CustomColor.secondaryColor
                                : CustomColor.whitePrimary,
                          ),
                        ),
                      ),
                    ),
                ],
              ),),

              Container(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 13),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: CustomColor.secondaryColor)
                ),
                child: Text("Resume",
                  style: GoogleFonts.firaCode().copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: CustomColor.secondaryColor,
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