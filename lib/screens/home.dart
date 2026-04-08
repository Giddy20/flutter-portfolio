import 'package:flutter/material.dart';
import 'package:gideon_aigbogun/constants/colors.dart';
import '../constants/size.dart';
import '../widgets/about_desktop.dart';
import '../widgets/contact_section.dart';
import '../widgets/custom_side_links.dart';
import '../widgets/custom_side_mail.dart';
import '../widgets/header_desktop.dart';
import '../widgets/main_desktop.dart';
import '../widgets/projects_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(3, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < kMinDesktopWidth;
    final isTablet =
        screenWidth >= kMinDesktopWidth && screenWidth < kMedDesktopWidth;

    // Responsive horizontal padding
    double hPadding;
    if (isMobile) {
      hPadding = 20;
    } else if (isTablet) {
      hPadding = 50;
    } else {
      hPadding = screenWidth * 0.1; // ~10% on large screens
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer: isMobile ? _buildMobileDrawer() : null,
          body: Stack(
            children: [
              SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: hPadding),
                  child: Column(
                    children: [
                      const SizedBox(height: 80), // space for fixed header
                      // HERO
                      MainDesktop(
                        isMobile: isMobile,
                        onContactTap: () => scrollToSection(2),
                        onExperienceTap: () => scrollToSection(1),
                      ),

                      // ABOUT
                      AboutDesktop(key: navbarKeys[0], isMobile: isMobile),

                      // EXPERIENCE
                      ProjectsSection(key: navbarKeys[1], isMobile: isMobile),

                      // CONTACT
                      ContactSection(key: navbarKeys[2]),
                    ],
                  ),
                ),
              ),

              // Fixed header
              Align(
                alignment: Alignment.topCenter,
                child: HeaderDesktop(
                  isMobile: isMobile,
                  onNavMenuTap: (int navIndex) {
                    scrollToSection(navIndex);
                  },
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              ),

              // Side rails (desktop only)
              if (!isMobile && !isTablet)
                Align(alignment: Alignment.centerLeft, child: SideLinks()),

              if (!isMobile && !isTablet)
                Align(alignment: Alignment.centerRight, child: SideMail()),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMobileDrawer() {
    final navLabels = ["About", "Experience", "Contact"];
    return Drawer(
      backgroundColor: CustomColor.cardBg,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: CustomColor.secondaryColor,
                    size: 28,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              const SizedBox(height: 30),
              for (int i = 0; i < navLabels.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      scrollToSection(i);
                    },
                    child: Row(
                      children: [
                        Text(
                          "0${i + 1}. ",
                          style: const TextStyle(
                            fontSize: 14,
                            color: CustomColor.secondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          navLabels[i],
                          style: const TextStyle(
                            fontSize: 18,
                            color: CustomColor.whitePrimary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              const Spacer(),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: CustomColor.secondaryColor),
                  ),
                  child: const Text(
                    "Resume",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.secondaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void scrollToSection(int navIndex) {
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }
}
