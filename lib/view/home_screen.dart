import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../utils/colors.dart';
import '../utils/text_styles.dart';
import 'sections/hero_section.dart';
import 'sections/booking_section.dart';
import 'sections/offers_section.dart';
import 'sections/catalogue_section.dart';
import 'sections/destinations_section.dart';
import 'sections/available_now_section.dart';
import 'sections/services_section.dart';
import 'sections/about_section.dart';
import 'sections/logbook_section.dart';
import 'sections/footer_section.dart';
import 'widgets/top_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      endDrawer: _buildMobileDrawer(controller),
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
                    const Positioned(
                      bottom: -100, // Overlaps the bottom of the hero section
                      left: 0,
                      right: 0,
                      child: BookingSection(),
                    ),
                  ],
                ),
                const SizedBox(height: 160), // Space to account for the overlapping booking section
                
                // 1. Seasonal Offers
                const OffersSection(),
                
                // 2. The Fleet
                CatalogueSection(key: controller.fleetKey),
                
                // 3. Where We Sail
                DestinationsSection(key: controller.destinationsKey),
                
                // 4. Available Now
                const AvailableNowSection(),
                
                // 5. Our Services
                ServicesSection(key: controller.servicesKey),
                
                // 6. Testimonial / About
                AboutSection(key: controller.aboutKey),
                
                // 7. The Logbook
                const LogbookSection(),
                
                // 8. Footer
                Container(
                  key: controller.contactKey,
                  child: const FooterSection(),
                ),
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

  Widget _buildMobileDrawer(HomeController controller) {
    return Drawer(
      backgroundColor: AppColors.primaryNavy,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        children: [
          _drawerItem('HOME', () => _closeAndScroll(controller.homeKey)),
          _drawerItem('FLEET', () => _closeAndScroll(controller.fleetKey)),
          _drawerItem('DESTINATIONS', () => _closeAndScroll(controller.destinationsKey)),
          _drawerItem('SERVICES', () => _closeAndScroll(controller.servicesKey)),
          _drawerItem('ABOUT', () => _closeAndScroll(controller.aboutKey)),
          _drawerItem('CONTACT', () => _closeAndScroll(controller.contactKey)),
        ],
      ),
    );
  }

  Widget _drawerItem(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(
        title,
        style: AppTextStyles.heading3.copyWith(color: AppColors.white),
      ),
      onTap: onTap,
    );
  }

  void _closeAndScroll(GlobalKey key) {
    Get.back(); // close drawer
    Get.find<HomeController>().scrollToSection(key);
  }
}
