
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gideon_aigbogun/constants/colors.dart';
import 'dart:js' as js;
import '../constants/links.dart';
import '../constants/size.dart';


class SideLinks extends StatelessWidget {
   SideLinks({super.key});

  Rx<Color> gitColor = Color(0xFF8C8C8C).obs;
  Rx<Color> linkedInColor = Color(0xFF8C8C8C).obs;
  Rx<Color> gmailColor = Color(0xFF8C8C8C).obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
      width: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              js.context.callMethod('open', [Links.github]);
            },
            onHover: (v){
              v == true ?
              gitColor.value = CustomColor.secondaryColor :
              v == false ?  gitColor.value = Color(0xFF8C8C8C) : null;
            },
            child: Image.asset(
              "assets/icons/github.png",
              width: 22, color: gitColor.value,
            ),
          ),
          verticalSpace(0.05),
          InkWell(
            onTap: () {
              js.context.callMethod('open', [Links.linkedIn]);
            },
            onHover: (v){
              v == true ?
              linkedInColor.value = CustomColor.secondaryColor :
              v == false ? linkedInColor.value = Color(0xFF8C8C8C) : null;
            },
            child: Image.asset(
              "assets/icons/linkedin.png",
              width: 22, color: linkedInColor.value,
            ),
          ),

          verticalSpace(0.05),

          InkWell(
            onTap: () {
              js.context.callMethod('open', [Links.blog]);
            },
            onHover: (v){
              v == true ?
              gmailColor.value = CustomColor.secondaryColor :
              v == false ?  gmailColor.value =  Color(0xFF8C8C8C) : null;
            },
            child: Image.asset(
              "assets/icons/gmail.png",
              width: 22, color: gmailColor.value,
            ),
          ),
          verticalSpace(0.05),
          SizedBox(
            height: height() * 0.13,
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
