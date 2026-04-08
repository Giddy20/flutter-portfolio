import 'package:flutter/material.dart';
import 'package:gideon_aigbogun/constants/size.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';
import '../utils/project_utils.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({super.key, required this.project});
  final ProjectUtils project;

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 290,
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColor.cardBg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            project.image,
            height: height() * 0.28,
            width: width(),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(
              project.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              project.subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: CustomColor.whiteSecondary,
              ),
            ),
          ),
          const Spacer(),
          Container(
            color: CustomColor.cardBg,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                const Text(
                  "Available on:",
                  style: TextStyle(
                    color: CustomColor.yellowSecondary,
                    fontSize: 10,
                  ),
                ),
                const Spacer(),
                if (project.iosLink != null)
                  InkWell(
                    onTap: () => _openUrl(project.iosLink!),
                    child: Image.asset("assets/icons/app-store.png", width: 19),
                  ),
                if (project.androidLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: InkWell(
                      onTap: () => _openUrl(project.androidLink!),
                      child: Image.asset(
                        "assets/icons/playstore.png",
                        width: 17,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
