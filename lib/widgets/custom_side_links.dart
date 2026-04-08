import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gideon_aigbogun/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/links.dart';
import '../constants/size.dart';

class SideLinks extends StatelessWidget {
  SideLinks({super.key});

  final Rx<Color> gitColor = const Color(0xFF8C8C8C).obs;
  final Rx<Color> linkedInColor = const Color(0xFF8C8C8C).obs;
  final Rx<Color> gmailColor = const Color(0xFF8C8C8C).obs;

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () => _openUrl(Links.github),
              onHover: (v) {
                gitColor.value = v
                    ? CustomColor.secondaryColor
                    : const Color(0xFF8C8C8C);
              },
              child: Image.asset(
                "assets/icons/github.png",
                width: 22,
                color: gitColor.value,
              ),
            ),
            verticalSpace(0.04),
            InkWell(
              onTap: () => _openUrl(Links.linkedIn),
              onHover: (v) {
                linkedInColor.value = v
                    ? CustomColor.secondaryColor
                    : const Color(0xFF8C8C8C);
              },
              child: Image.asset(
                "assets/icons/linkedin.png",
                width: 22,
                color: linkedInColor.value,
              ),
            ),
            verticalSpace(0.04),
            InkWell(
              onTap: () => _openUrl('mailto:aigbogungideon@gmail.com'),
              onHover: (v) {
                gmailColor.value = v
                    ? CustomColor.secondaryColor
                    : const Color(0xFF8C8C8C);
              },
              child: Image.asset(
                "assets/icons/gmail.png",
                width: 22,
                color: gmailColor.value,
              ),
            ),
            verticalSpace(0.04),
            SizedBox(
              height: height() * 0.13,
              child: const VerticalDivider(
                color: Color(0xFF8C8C8C),
                width: 2,
                thickness: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
