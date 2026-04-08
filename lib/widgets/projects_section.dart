import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gideon_aigbogun/constants/nav_items.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../constants/size.dart';

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key, this.isMobile = false});

  final bool isMobile;
  final RxInt hoveredIndex = (-1).obs;
  final RxInt currentIndex = 0.obs;

  // Experience data - each tab maps to role content
  final List<Map<String, String>> experiences = [
    {
      'company': 'Nokterna',
      'role': 'Flutter Developer',
      'period': 'September 2025 – Dec 2025',
      'desc':
          '• Developed a Social Bar and Dating App from scratch.\n'
          '• Implemented different features like user Matching, Bar open and close'
          'across all time zones, chat messaging with specialized rules\n',
    },
    {
      'company': 'Intimid',
      'role': 'Flutter Developer',
      'period': 'Nov 2024 – Sept 2025',
      'desc':
          '• Built and maintained core features for the Intimid AI-powered dating app using Flutter.\n'
          '• Integrated REST APIs and managed state with GetX for reactive UI updates.\n'
          '• Collaborated with the design team to implement pixel-perfect, responsive layouts.',
    },
    {
      'company': 'Leaf',
      'role': 'Mobile Developer',
      'period': '2023 – 2024',
      'desc':
          '• Developed cross-platform mobile features for the Leaf platform.\n'
          '• Implemented clean architecture patterns and modular design.\n'
          '• Worked with CI/CD pipelines for automated builds and deployments.',
    },
    {
      'company': 'Yought',
      'role': 'Flutter Developer',
      'period': '2022 – 2023',
      'desc':
          '• Built scalable mobile features using Flutter and Dart.\n'
          '• Integrated Firebase services for authentication and real-time data.\n'
          '• Mentored junior developers and conducted code reviews.',
    },
    {
      'company': 'Smart Term',
      'role': 'Junior Developer',
      'period': '2021 – 2022',
      'desc':
          '• Contributed to mobile app development projects using Flutter.\n'
          '• Learned and applied best practices in mobile app architecture.\n'
          '• Assisted in testing, debugging, and deploying applications.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          _sectionHeader("02.", "Experience"),
          const SizedBox(height: 30),

          if (isMobile) _buildMobileLayout() else _buildDesktopLayout(),
        ],
      ),
    );
  }

  Widget _sectionHeader(String number, String title) {
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

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Horizontal scrollable tabs
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(
            () => Row(
              children: [
                for (int i = 0; i < projectTitles.length; i++)
                  InkWell(
                    onTap: () => currentIndex.value = i,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: currentIndex.value == i
                                ? CustomColor.secondaryColor
                                : CustomColor.bgLight2,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        projectTitles[i],
                        style: GoogleFonts.firaCode().copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: currentIndex.value == i
                              ? CustomColor.secondaryColor
                              : CustomColor.whitePrimary,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        // Content
        Obx(() => _buildExperienceContent(currentIndex.value)),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Vertical tabs
        SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < projectTitles.length; i++)
                Obx(
                  () => InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () => currentIndex.value = i,
                    onHover: (v) => hoveredIndex.value = v ? i : -1,
                    child: Row(
                      children: [
                        Container(
                          width: 3,
                          height: 42,
                          color: currentIndex.value == i
                              ? CustomColor.secondaryColor
                              : CustomColor.bgLight2.withOpacity(0.4),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            color: hoveredIndex.value == i
                                ? CustomColor.cardBg.withOpacity(0.3)
                                : Colors.transparent,
                            child: Text(
                              projectTitles[i],
                              style: GoogleFonts.firaCode().copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color:
                                    currentIndex.value == i ||
                                        hoveredIndex.value == i
                                    ? CustomColor.secondaryColor
                                    : CustomColor.whitePrimary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(width: 30),
        // Content area
        Expanded(child: Obx(() => _buildExperienceContent(currentIndex.value))),
      ],
    );
  }

  Widget _buildExperienceContent(int index) {
    if (index >= experiences.length) return const SizedBox();
    final exp = experiences[index];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '${exp['role']}',
                style: robotoTextFont.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary,
                ),
              ),
              TextSpan(
                text: ' @ ${exp['company']}',
                style: robotoTextFont.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.secondaryColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Text(
          exp['period'] ?? '',
          style: GoogleFonts.firaCode().copyWith(
            fontSize: 13,
            color: CustomColor.greyText,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          exp['desc'] ?? '',
          style: robotoTextFont.copyWith(
            fontSize: 14,
            height: 1.8,
            fontWeight: FontWeight.w300,
            color: CustomColor.greyText,
          ),
        ),
      ],
    );
  }
}
