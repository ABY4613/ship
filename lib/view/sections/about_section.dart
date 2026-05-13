import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 1000;

    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80, vertical: 80),
      child: isMobile
          ? Column(
              children: [
                _buildLeftImage(),
                const SizedBox(height: 60),
                _buildRightContent(),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 4, child: _buildLeftImage()),
                const SizedBox(width: 80),
                Expanded(flex: 5, child: _buildRightContent()),
              ],
            ),
    );
  }

  Widget _buildLeftImage() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.network(
          'https://images.unsplash.com/photo-1540946485063-a40da27545f8?q=80&w=2080&auto=format&fit=crop',
          height: 500,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: -20,
          right: -20,
          child: Container(
            width: 140,
            height: 140,
            color: AppColors.accentGoldLight, // Tan/gold color from design
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('38', style: AppTextStyles.heading2.copyWith(fontSize: 48, color: AppColors.primaryNavy)),
                const SizedBox(height: 4),
                Container(width: double.infinity, height: 1, color: AppColors.primaryNavy),
                const SizedBox(height: 8),
                Text('YEARS AT SEA', style: AppTextStyles.overline.copyWith(color: AppColors.primaryNavy, fontSize: 8)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRightContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '“',
          style: AppTextStyles.heading1.copyWith(
            color: AppColors.accentGoldLight,
            fontSize: 80,
            height: 0.5,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          '“Meridian curated a week I genuinely didn\'t want to end — unexpected anchorages, a chef who knew my palate by day three, and a crew who anticipated every wish before I spoke it.”',
          style: AppTextStyles.heading2Italic.copyWith(
            fontSize: 28,
            color: AppColors.primaryNavy,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            Container(width: 40, height: 1, color: AppColors.textGrey.withOpacity(0.3)),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Léa Moreau', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.primaryNavy)),
                const SizedBox(height: 4),
                Text('CHARTERED AURELIA · JULY 2025', style: AppTextStyles.overline.copyWith(color: AppColors.textGrey, fontSize: 8)),
              ],
            )
          ],
        ),
        const SizedBox(height: 60),
        Divider(color: AppColors.textGrey.withOpacity(0.2)),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _statItem('120+', 'YACHTS', true),
            _statItem('46', 'DESTINATIONS', false),
            _statItem('4.98', 'GUEST RATING', false),
          ],
        )
      ],
    );
  }

  Widget _statItem(String val, String label, bool highlight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: AppTextStyles.heading3.copyWith(fontSize: 28),
            children: [
              TextSpan(
                text: val.replaceAll('+', ''),
                style: const TextStyle(color: AppColors.primaryNavy),
              ),
              if (val.contains('+'))
                TextSpan(
                  text: '+',
                  style: TextStyle(color: highlight ? AppColors.accentGold : AppColors.primaryNavy),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(width: 60, height: 1, color: AppColors.textGrey.withOpacity(0.3)),
        const SizedBox(height: 8),
        Text(label, style: AppTextStyles.overline.copyWith(color: AppColors.textGrey, fontSize: 8)),
      ],
    );
  }
}
