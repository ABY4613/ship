import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../controller/home_controller.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Top dark banner
        _buildTopBanner(context),
        
        // Main Nav Bar
        Container(
          color: AppColors.white.withOpacity(0.95), // Slight transparency for modern feel
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
        ),
      ],
    );
  }

  Widget _buildTopBanner(BuildContext context) {
    if (MediaQuery.of(context).size.width < 800) {
      return const SizedBox.shrink();
    }

    return Container(
      color: AppColors.primaryNavy,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: Contact Info
          Row(
            children: [
              const Icon(Icons.phone_outlined, color: AppColors.accentGold, size: 14),
              const SizedBox(width: 8),
              Text(
                '+1 (305) 555 - 1847',
                style: AppTextStyles.overline.copyWith(color: AppColors.accentGold, letterSpacing: 1.5, fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 24),
              Text(
                '|',
                style: AppTextStyles.overline.copyWith(color: AppColors.accentGold.withOpacity(0.5)),
              ),
              const SizedBox(width: 24),
              const Icon(Icons.mail_outline, color: AppColors.accentGold, size: 14),
              const SizedBox(width: 8),
              Text(
                'CHARTER@MERIDIAN-YACHTS.COM',
                style: AppTextStyles.overline.copyWith(color: AppColors.accentGold, letterSpacing: 1.5, fontWeight: FontWeight.w500),
              ),
            ],
          ),

          // Middle: EST. 1987 MONACO
          Row(
            children: [
              Container(width: 30, height: 1, color: AppColors.accentGold.withOpacity(0.5)),
              const SizedBox(width: 16),
              Text(
                'EST. 1987 · MONACO',
                style: AppTextStyles.overline.copyWith(color: AppColors.accentGold, letterSpacing: 2.5),
              ),
              const SizedBox(width: 16),
              Container(width: 30, height: 1, color: AppColors.accentGold.withOpacity(0.5)),
            ],
          ),

          // Right: Social & Language
          Row(
            children: [
              const FaIcon(FontAwesomeIcons.instagram, color: AppColors.accentGold, size: 14),
              const SizedBox(width: 16),
              const FaIcon(FontAwesomeIcons.facebookF, color: AppColors.accentGold, size: 14),
              const SizedBox(width: 16),
              const FaIcon(FontAwesomeIcons.twitter, color: AppColors.accentGold, size: 14),
              const SizedBox(width: 16),
              const FaIcon(FontAwesomeIcons.youtube, color: AppColors.accentGold, size: 14),
              const SizedBox(width: 24),
              Text(
                '|',
                style: AppTextStyles.overline.copyWith(color: AppColors.accentGold.withOpacity(0.5)),
              ),
              const SizedBox(width: 24),
              const Icon(Icons.language, color: AppColors.accentGold, size: 14),
              const SizedBox(width: 8),
              Text(
                'EN · USD',
                style: AppTextStyles.overline.copyWith(color: AppColors.accentGold, letterSpacing: 1.5, fontWeight: FontWeight.w500),
              ),
            ],
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
