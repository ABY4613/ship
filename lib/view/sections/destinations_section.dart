import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class DestinationsSection extends StatelessWidget {
  const DestinationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('— WHERE WE SAIL', style: AppTextStyles.overline),
          const SizedBox(height: 20),
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: AppTextStyles.heading2.copyWith(fontSize: 32),
                        children: [
                          const TextSpan(text: 'A world charted by\n'),
                          TextSpan(
                            text: 'tide, taste and time.',
                            style: AppTextStyles.heading2Italic,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "From the limestone cliffs of Capri to the translucent coves of Vis, we operate in the world's most coveted cruising grounds — each itinerary hand-drawn by local captains.",
                      style: AppTextStyles.bodyMedium,
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: AppTextStyles.heading2.copyWith(fontSize: 48),
                          children: [
                            const TextSpan(text: 'A world charted by\n'),
                            TextSpan(
                              text: 'tide, taste and time.',
                              style: AppTextStyles.heading2Italic,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10, left: 40),
                        child: Text(
                          "From the limestone cliffs of Capri to the translucent coves of Vis, we operate in the world's most coveted cruising grounds — each itinerary hand-drawn by local captains.",
                          style: AppTextStyles.bodyMedium,
                        ),
                      ),
                    ),
                  ],
                ),
          const SizedBox(height: 60),
          isMobile
              ? Column(
                  children: [
                    _DestinationCard(number: '01', title: 'French Riviera', imageUrl: 'https://images.unsplash.com/photo-1533676802871-eca1ae998cd5?q=80&w=2071&auto=format&fit=crop', height: 300),
                    const SizedBox(height: 20),
                    _DestinationCard(number: '02', title: 'Dalmatian Coast', imageUrl: 'https://images.unsplash.com/photo-1555881400-74d7acaacd8b?q=80&w=2070&auto=format&fit=crop', height: 300),
                    const SizedBox(height: 20),
                    _DestinationCard(number: '03', title: 'Amalfi Coast', imageUrl: 'https://images.unsplash.com/photo-1533091090875-1ff4cc497bfa?q=80&w=2069&auto=format&fit=crop', height: 300),
                  ],
                )
              : SizedBox(
                  height: 500,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: _DestinationCard(number: '01', title: 'French Riviera', imageUrl: 'https://images.unsplash.com/photo-1533676802871-eca1ae998cd5?q=80&w=2071&auto=format&fit=crop'),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(child: _DestinationCard(number: '02', title: 'Dalmatian Coast', imageUrl: 'https://images.unsplash.com/photo-1555881400-74d7acaacd8b?q=80&w=2070&auto=format&fit=crop')),
                            const SizedBox(height: 20),
                            Expanded(child: _DestinationCard(number: '03', title: 'Amalfi Coast', imageUrl: 'https://images.unsplash.com/photo-1533091090875-1ff4cc497bfa?q=80&w=2069&auto=format&fit=crop')),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 1,
                        child: _DestinationCard(number: '04', title: 'Caribbean', imageUrl: 'https://images.unsplash.com/photo-1548574505-5e239809ee19?q=80&w=2064&auto=format&fit=crop'),
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
  final String title;
  final String imageUrl;
  final double? height;

  const _DestinationCard({
    required this.number,
    required this.title,
    required this.imageUrl,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.transparent,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(number, style: AppTextStyles.buttonText.copyWith(color: AppColors.white)),
            ),
            Text(title, style: AppTextStyles.heading3.copyWith(color: AppColors.white)),
          ],
        ),
      ),
    );
  }
}
