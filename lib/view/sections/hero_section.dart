import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Container(
      width: double.infinity,
      height: size.height, // Full screen height
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1567899378494-47b22a2ae96a?q=80&w=2070&auto=format&fit=crop'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: AppColors.primaryNavy.withOpacity(0.3), // Dark overlay
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100), // Space for top nav
            Text(
              '— PRIVATE YACHT CHARTERS - 1987',
              style: AppTextStyles.overline.copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: AppTextStyles.heading1.copyWith(
                  fontSize: isMobile ? 48 : 72,
                ),
                children: [
                  const TextSpan(text: 'Sail beyond the '),
                  TextSpan(
                    text: 'ordinary,\n',
                    style: AppTextStyles.heading1Italic,
                  ),
                  const TextSpan(text: 'into the\n'),
                  TextSpan(
                    text: 'Mediterranean blue.',
                    style: AppTextStyles.heading1Italic.copyWith(color: AppColors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: isMobile ? double.infinity : 400,
              child: Text(
                'A curated fleet of 120+ crewed superyachts across Monaco, Amalfi, Croatia and the Caribbean. Designed for those who refuse to arrive the same way twice.',
                style: AppTextStyles.bodyLarge,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentGoldLight,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  ),
                  child: Row(
                    children: [
                      Text('EXPLORE THE FLEET', style: AppTextStyles.buttonText.copyWith(color: AppColors.primaryNavy)),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward, color: AppColors.primaryNavy, size: 16),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.white.withOpacity(0.5)),
                        ),
                        child: const Icon(Icons.play_arrow, color: AppColors.white, size: 20),
                      ),
                      const SizedBox(width: 10),
                      Text('WATCH THE FILM', style: AppTextStyles.buttonText.copyWith(color: AppColors.white)),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
