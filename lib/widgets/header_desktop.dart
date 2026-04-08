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
    required this.isMobile,
    this.onMenuTap,
  });

  final Function(int) onNavMenuTap;
  final bool isMobile;
  final VoidCallback? onMenuTap;

  final Rx<Color> menuColor = CustomColor.whitePrimary.obs;
  final RxInt hoveredIndex = (-1).obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      color: CustomColor.primaryColor.withOpacity(0.95),
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16.0 : 40.0),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Text(
            "G",
            style: robotoTextFont.copyWith(
              fontSize: 40,
              fontWeight: FontWeight.w500,
              color: CustomColor.secondaryColor,
            ),
          ),

          // Desktop nav links or mobile hamburger
          if (isMobile)
            IconButton(
              icon: const Icon(
                Icons.menu,
                color: CustomColor.secondaryColor,
                size: 28,
              ),
              onPressed: onMenuTap,
            )
          else
            Row(
              children: [
                Obx(
                  () => Row(
                    children: [
                      for (int i = 0; i < navTitles.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: InkWell(
                            onTap: () => onNavMenuTap(i),
                            onHover: (v) {
                              hoveredIndex.value = v ? i : -1;
                            },
                            child: Row(
                              children: [
                                Text(
                                  "0${i + 1}. ",
                                  style: GoogleFonts.firaCode().copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: CustomColor.secondaryColor,
                                  ),
                                ),
                                Text(
                                  navTitles[i],
                                  style: GoogleFonts.firaCode().copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: hoveredIndex.value == i
                                        ? CustomColor.secondaryColor
                                        : CustomColor.whitePrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 7,
                    horizontal: 13,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: CustomColor.secondaryColor),
                  ),
                  child: Text(
                    "Resume",
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
