
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gideon_aigbogun/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:js' as js;
import '../constants/links.dart';
import '../constants/size.dart';


class SideMail extends StatelessWidget {
  SideMail({super.key});

  Rx<Color> mailColor = CustomColor.whitePrimary.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
      width: 130,
      height: height(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          InkWell(
            onTap: () {
              js.context.callMethod('open', [Links.blog]);
            },
            onHover: (v){
              v == true ?
              mailColor.value = CustomColor.secondaryColor :
              v == false ?  mailColor.value =  CustomColor.whitePrimary : null;
            },
            child: RotatedBox(
              quarterTurns: 1,
              child: Text("aigbogungideon@gmail.com",
              style: GoogleFonts.firaCode().copyWith(
                fontSize: 12,
                color: mailColor.value
              ) ,),
            )
          ),
          verticalSpace(0.05),
          SizedBox(
            height: height() * 0.15,
            child: VerticalDivider(
              color: Color(0xFF8C8C8C),
              width: 2, thickness: 1.5,
            ),
          )
        ],
      ),
    ));
  }
}
