import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Container(
      color: AppColors.white.withOpacity(
        0.95,
      ), // Slight transparency for modern feel
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Row(
            children: [
              const Icon(Icons.anchor, color: AppColors.primaryNavy, size: 28),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Meridian',
                    style: AppTextStyles.heading4.copyWith(
                      color: AppColors.primaryNavy,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    'YACHT CHARTERS',
                    style: AppTextStyles.overline.copyWith(
                      color: AppColors.accentGold,
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Navigation Links (Hide on very small screens)
          if (MediaQuery.of(context).size.width > 800)
            Row(
              children: [
                _navItem(
                  'HOME',
                  () => controller.scrollToSection(controller.homeKey),
                ),
                _navItem(
                  'FLEET',
                  () => controller.scrollToSection(controller.fleetKey),
                ),
                _navItem(
                  'DESTINATIONS',
                  () => controller.scrollToSection(controller.destinationsKey),
                ),
                _navItem(
                  'SERVICES',
                  () => controller.scrollToSection(controller.servicesKey),
                ),
                _navItem(
                  'ABOUT',
                  () => controller.scrollToSection(controller.aboutKey),
                ),
                _navItem(
                  'CONTACT',
                  () => controller.scrollToSection(controller.contactKey),
                ),
              ],
            ),

          // Book Now Button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryNavy,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'BOOK NOW',
                  style: AppTextStyles.buttonText.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward,
                  color: AppColors.white,
                  size: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        onTap: onTap,
        child: Text(title, style: AppTextStyles.navLink),
      ),
    );
  }
}
