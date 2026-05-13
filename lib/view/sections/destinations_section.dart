import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class DestinationsSection extends StatelessWidget {
  const DestinationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 1000;

    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('— WHERE WE SAIL', style: AppTextStyles.overline.copyWith(color: AppColors.accentGold, letterSpacing: 2.0)),
          const SizedBox(height: 20),
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: AppTextStyles.heading2.copyWith(fontSize: 32, color: AppColors.primaryNavy),
                        children: [
                          const TextSpan(text: 'A world charted by\n'),
                          TextSpan(
                            text: 'tide, taste and time.',
                            style: AppTextStyles.heading2Italic.copyWith(color: AppColors.accentGoldLight),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "From the limestone cliffs of Capri to the translucent coves of Vis, we operate in the world's most coveted cruising grounds — each itinerary hand-drawn by local captains.",
                      style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textGrey),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 5,
                      child: RichText(
                        text: TextSpan(
                          style: AppTextStyles.heading2.copyWith(fontSize: 48, color: AppColors.primaryNavy),
                          children: [
                            const TextSpan(text: 'A world charted by\n'),
                            TextSpan(
                              text: 'tide, taste and time.',
                              style: AppTextStyles.heading2Italic.copyWith(color: AppColors.accentGoldLight),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10, left: 40),
                        child: Text(
                          "From the limestone cliffs of Capri to the translucent coves of Vis, we operate in the world's most coveted cruising grounds — each itinerary hand-drawn by local captains.",
                          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textGrey),
                        ),
                      ),
                    ),
                  ],
                ),
          const SizedBox(height: 80),
          isMobile
              ? Column(
                  children: [
                    _DestinationCard(number: '01', country: 'ITALY', title: 'Amalfi Coast', nights: '7 NIGHTS ITINERARY', imageUrl: 'https://images.unsplash.com/photo-1533091090875-1ff4cc497bfa?q=80&w=2069&auto=format&fit=crop', height: 400),
                    const SizedBox(height: 20),
                    _DestinationCard(number: '02', country: 'FRANCE', title: 'French Riviera', nights: '5 NIGHTS ITINERARY', imageUrl: 'https://images.unsplash.com/photo-1533676802871-eca1ae998cd5?q=80&w=2071&auto=format&fit=crop', height: 400),
                    const SizedBox(height: 20),
                    _DestinationCard(number: '03', country: 'CROATIA', title: 'Dalmatian Coast', nights: '10 NIGHTS ITINERARY', imageUrl: 'https://images.unsplash.com/photo-1555881400-74d7acaacd8b?q=80&w=2070&auto=format&fit=crop', height: 400),
                    const SizedBox(height: 20),
                    _DestinationCard(number: '04', country: 'CARIBBEAN', title: 'British Virgin Islands', nights: '7 NIGHTS ITINERARY', imageUrl: 'https://images.unsplash.com/photo-1548574505-5e239809ee19?q=80&w=2064&auto=format&fit=crop', height: 400),
                  ],
                )
              : SizedBox(
                  height: 600,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: _DestinationCard(number: '01', country: 'ITALY', title: 'Amalfi Coast', nights: '7 NIGHTS ITINERARY', imageUrl: 'https://images.unsplash.com/photo-1533091090875-1ff4cc497bfa?q=80&w=2069&auto=format&fit=crop'),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 100), // Pushed down
                          child: _DestinationCard(number: '02', country: 'FRANCE', title: 'French Riviera', nights: '5 NIGHTS ITINERARY', imageUrl: 'https://images.unsplash.com/photo-1533676802871-eca1ae998cd5?q=80&w=2071&auto=format&fit=crop'),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 100), // Pushed down
                          child: _DestinationCard(number: '03', country: 'CROATIA', title: 'Dalmatian Coast', nights: '10 NIGHTS ITINERARY', imageUrl: 'https://images.unsplash.com/photo-1555881400-74d7acaacd8b?q=80&w=2070&auto=format&fit=crop'),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _DestinationCard(number: '04', country: 'CARIBBEAN', title: 'British Virgin Islands', nights: '7 NIGHTS ITINERARY', imageUrl: 'https://images.unsplash.com/photo-1548574505-5e239809ee19?q=80&w=2064&auto=format&fit=crop'),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}

class _DestinationCard extends StatelessWidget {
  final String number;
  final String country;
  final String title;
  final String nights;
  final String imageUrl;
  final double? height;

  const _DestinationCard({
    required this.number,
    required this.country,
    required this.title,
    required this.nights,
    required this.imageUrl,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.8),
              Colors.transparent,
            ],
            stops: const [0.0, 0.4],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(number, style: AppTextStyles.buttonText.copyWith(color: AppColors.white)),
                  const SizedBox(height: 4),
                  Container(width: 16, height: 1, color: AppColors.white),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(country, style: AppTextStyles.overline.copyWith(color: AppColors.accentGoldLight, letterSpacing: 2.0)),
                const SizedBox(height: 8),
                Text(title, style: AppTextStyles.heading3.copyWith(color: AppColors.white, fontSize: 24)),
                const SizedBox(height: 8),
                Text(nights, style: AppTextStyles.overline.copyWith(color: AppColors.textGrey, fontSize: 8, letterSpacing: 2.0)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
