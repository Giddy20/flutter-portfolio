import 'package:flutter/material.dart';
import 'package:gideon_aigbogun/constants/colors.dart';

import '../constants/links.dart';
import '../constants/size.dart';

import 'dart:js' as js;

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
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomColor.scaffoldBg,
        endDrawer: constraints.maxWidth >= kMinDesktopWidth
            ? null : SizedBox(),
        //     : S(onNavItemTap: (int navIndex) {
        //   scaffoldKey.currentState?.closeEndDrawer();
        //   scrollToSection(navIndex);
        // }),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 160),
                child: Column(
                  children: [
                    SizedBox(),
                    // MAIN

                    if (constraints.maxWidth >= kMinDesktopWidth)
                      MainDesktop(key: navbarKeys[0],)
                    else
                      const SizedBox(),
                    // Divider(color: CustomColor.secondaryColor, height: 30,),

                    if (constraints.maxWidth >= kMinDesktopWidth)
                      AboutDesktop(key: navbarKeys[1],)
                    else
                      const SizedBox(),


                    ProjectsSection(
                      key: navbarKeys[2],
                    ),


                    ContactSection(
                      key: navbarKeys[3],
                    ),

                  ],
                ),
              ),
            ),

            Align(
                alignment: Alignment.topCenter,
                child: (constraints.maxWidth >= kMinDesktopWidth) ?
                HeaderDesktop(onNavMenuTap: (int navIndex) {
                  scrollToSection(navIndex);
                }) : SizedBox()
            ),

            Align(
                alignment: Alignment.centerLeft,
                child: (constraints.maxWidth >= kMinDesktopWidth) ?
                SideLinks() : SizedBox()
            ),

            Align(
                alignment: Alignment.centerRight,
                child: (constraints.maxWidth >= kMinDesktopWidth) ?
                SideMail() : SizedBox()
            ),
          ],
        ),
      );
    });
  }

  void scrollToSection(int navIndex) {
    // if (navIndex == 4) {
    //   // open a blog page
    //   js.context.callMethod('open', [Links.blog]);
    //   return;
    // }

    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }
}