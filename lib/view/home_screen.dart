import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../utils/colors.dart';
import '../utils/text_styles.dart';
import 'sections/hero_section.dart';
import 'sections/booking_section.dart';
import 'sections/catalogue_section.dart';
import 'sections/offers_section.dart';
import 'sections/destinations_section.dart';
import 'widgets/top_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    HeroSection(key: controller.homeKey),
                    Positioned(
                      bottom: -100, // Overlaps the bottom of the hero section
                      left: 0,
                      right: 0,
                      child: const BookingSection(),
                    ),
                  ],
                ),
                const SizedBox(height: 160), // Space to account for the overlapping booking section
                OffersSection(key: controller.servicesKey),
                const SizedBox(height: 80),
                CatalogueSection(key: controller.fleetKey),
                const SizedBox(height: 80),
                DestinationsSection(key: controller.destinationsKey),
                const SizedBox(height: 80),
                // Footer
                Container(
                  key: controller.contactKey,
                  color: AppColors.primaryNavy,
                  padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      '© 2026 Meridian Yacht Charters. All rights reserved.',
                      style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          // Sticky Top Nav Bar
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: TopNavBar(),
          ),
        ],
      ),
    );
  }
}
