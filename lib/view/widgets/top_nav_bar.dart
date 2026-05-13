import 'dart:ui';
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
        
        // Main Nav Bar with Glassmorphism
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: AppColors.white.withOpacity(0.85), // Glassmorphism background
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => controller.scrollToSection(controller.homeKey),
                      child: Row(
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
                    ),
                  ),

                  // Navigation Links (Hide on very small screens)
                  if (MediaQuery.of(context).size.width > 800)
                    Row(
                      children: [
                        HoverNavItem(title: 'HOME', onTap: () => controller.scrollToSection(controller.homeKey)),
                        HoverNavItem(title: 'FLEET', onTap: () => controller.scrollToSection(controller.fleetKey)),
                        HoverNavItem(title: 'DESTINATIONS', onTap: () => controller.scrollToSection(controller.destinationsKey)),
                        HoverNavItem(title: 'SERVICES', onTap: () => controller.scrollToSection(controller.servicesKey)),
                        HoverNavItem(title: 'ABOUT', onTap: () => controller.scrollToSection(controller.aboutKey)),
                        HoverNavItem(title: 'CONTACT', onTap: () => controller.scrollToSection(controller.contactKey)),
                      ],
                    )
                  else
                    IconButton(
                      icon: const Icon(Icons.menu, color: AppColors.primaryNavy),
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    ),

                  // Book Now Button
                  if (MediaQuery.of(context).size.width > 600)
                    const _BookNowButton(),
                ],
              ),
            ),
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
}

class HoverNavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const HoverNavItem({super.key, required this.title, required this.onTap});

  @override
  State<HoverNavItem> createState() => _HoverNavItemState();
}

class _HoverNavItemState extends State<HoverNavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: AppTextStyles.navLink.copyWith(
                  color: _isHovered ? AppColors.accentGold : AppColors.primaryNavy,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutQuint,
                height: 1,
                width: _isHovered ? 24 : 0,
                color: AppColors.accentGold,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _BookNowButton extends StatefulWidget {
  const _BookNowButton();

  @override
  State<_BookNowButton> createState() => _BookNowButtonState();
}

class _BookNowButtonState extends State<_BookNowButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutQuint,
        transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
        decoration: BoxDecoration(
          color: AppColors.primaryNavy,
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.accentGold.withOpacity(0.5),
                    blurRadius: 20,
                    spreadRadius: 2,
                    offset: const Offset(0, 5),
                  )
                ]
              : [],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    style: AppTextStyles.buttonText.copyWith(
                      color: _isHovered ? AppColors.accentGold : AppColors.white,
                    ),
                    child: const Text('BOOK NOW'),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward,
                    color: _isHovered ? AppColors.accentGold : AppColors.white,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
