import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class LogbookSection extends StatelessWidget {
  const LogbookSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Container(
      color: AppColors.backgroundLight, // or AppColors.white depending on exact match
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 40 : 80, vertical: 80),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLeftContent(isMobile),
                const SizedBox(height: 60),
                _buildRightContent(isMobile),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: _buildLeftContent(isMobile)),
                const SizedBox(width: 80),
                Expanded(child: _buildRightContent(isMobile)),
              ],
            ),
    );
  }

  Widget _buildLeftContent(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '— THE LOGBOOK',
          style: AppTextStyles.overline,
        ),
        const SizedBox(height: 24),
        RichText(
          text: TextSpan(
            style: AppTextStyles.heading2.copyWith(
              fontSize: isMobile ? 36 : 56,
              color: AppColors.primaryNavy,
              height: 1.1,
            ),
            children: [
              const TextSpan(text: 'Our dispatches,\nfrom '),
              TextSpan(
                text: 'the open sea.',
                style: AppTextStyles.heading2Italic.copyWith(
                  fontSize: isMobile ? 36 : 56,
                  color: AppColors.accentGoldLight, // The image shows a lighter gold/tan
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Text(
          'Off-season itineraries, newly listed yachts and quiet coves worth re-\nrouting for — delivered twelve times a year. Never shared.',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textGrey,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildRightContent(bool isMobile) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.primaryNavy, width: 1.0),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'your@email.com',
                hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.textGrey.withOpacity(0.5)),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.primaryNavy),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'SUBSCRIBE',
                  style: AppTextStyles.buttonText.copyWith(letterSpacing: 2.0),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward, size: 16, color: AppColors.primaryNavy),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
