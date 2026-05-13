import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Container(
      color: AppColors.primaryNavy,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80, vertical: 80),
      child: Stack(
        children: [
          // Background text "Meridian"
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Text(
              'Meridian',
              textAlign: TextAlign.center,
              style: AppTextStyles.heading1.copyWith(
                fontSize: isMobile ? 120 : 300,
                color: AppColors.white.withOpacity(0.02),
                height: 0.8,
              ),
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('— OUR SERVICES', style: AppTextStyles.overline.copyWith(color: AppColors.accentGold, letterSpacing: 2.0)),
              const SizedBox(height: 20),
              Text(
                'Four ways to step aboard.',
                style: AppTextStyles.heading2.copyWith(fontSize: isMobile ? 36 : 48, color: AppColors.white),
              ),
              const SizedBox(height: 60),
              isMobile
                  ? Column(
                      children: [
                        _ServiceCard(
                          number: '01',
                          icon: Icons.wb_twilight_outlined,
                          title: 'Day Charters',
                          description: 'Sunrise swims, leisurely lunches and golden-hour anchorages — our 8-hour escapes from port.',
                        ),
                        const SizedBox(height: 20),
                        _ServiceCard(
                          number: '02',
                          icon: Icons.explore_outlined,
                          title: 'Weekly Voyages',
                          description: 'Multi-country itineraries with private chefs, curated shore excursions and full crew.',
                        ),
                        const SizedBox(height: 20),
                        _ServiceCard(
                          number: '03',
                          icon: Icons.people_outline,
                          title: 'Corporate & Events',
                          description: 'Product launches, executive retreats and weddings afloat — bespoke planning included.',
                        ),
                        const SizedBox(height: 20),
                        _ServiceCard(
                          number: '04',
                          icon: Icons.auto_awesome_outlined,
                          title: 'Crewed Superyachts',
                          description: 'Private fleets over 60m with helicopter decks, spa suites and Michelin-trained chefs.',
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _ServiceCard(
                            number: '01',
                            icon: Icons.wb_twilight_outlined,
                            title: 'Day Charters',
                            description: 'Sunrise swims, leisurely lunches and golden-hour anchorages — our 8-hour escapes from port.',
                          ),
                        ),
                        Container(width: 1, height: 300, color: AppColors.white.withOpacity(0.05)),
                        Expanded(
                          child: _ServiceCard(
                            number: '02',
                            icon: Icons.explore_outlined,
                            title: 'Weekly Voyages',
                            description: 'Multi-country itineraries with private chefs, curated shore excursions and full crew.',
                          ),
                        ),
                        Container(width: 1, height: 300, color: AppColors.white.withOpacity(0.05)),
                        Expanded(
                          child: _ServiceCard(
                            number: '03',
                            icon: Icons.people_outline,
                            title: 'Corporate & Events',
                            description: 'Product launches, executive retreats and weddings afloat — bespoke planning included.',
                          ),
                        ),
                        Container(width: 1, height: 300, color: AppColors.white.withOpacity(0.05)),
                        Expanded(
                          child: _ServiceCard(
                            number: '04',
                            icon: Icons.auto_awesome_outlined,
                            title: 'Crewed Superyachts',
                            description: 'Private fleets over 60m with helicopter decks, spa suites and Michelin-trained chefs.',
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String number;
  final IconData icon;
  final String title;
  final String description;

  const _ServiceCard({
    required this.number,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(number, style: AppTextStyles.overline.copyWith(color: AppColors.white.withOpacity(0.5))),
          const SizedBox(height: 30),
          Icon(icon, color: AppColors.accentGoldLight, size: 24),
          const SizedBox(height: 24),
          Text(title, style: AppTextStyles.heading3.copyWith(color: AppColors.white, fontSize: 24)),
          const SizedBox(height: 16),
          Text(
            description,
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textGrey, height: 1.6),
          ),
          const SizedBox(height: 40),
          Divider(color: AppColors.white.withOpacity(0.1)),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('INQUIRE', style: AppTextStyles.buttonText.copyWith(color: AppColors.white.withOpacity(0.8), letterSpacing: 2.0)),
                const SizedBox(width: 8),
                Icon(Icons.arrow_forward, size: 14, color: AppColors.white.withOpacity(0.8)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
