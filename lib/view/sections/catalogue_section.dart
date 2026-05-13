import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class CatalogueSection extends StatelessWidget {
  const CatalogueSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 1000;

    return Container(
      color: AppColors.backgroundLight,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80, vertical: 80),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('— THE FLEET · 04 FEATURED', style: AppTextStyles.overline.copyWith(color: AppColors.accentGold)),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      style: AppTextStyles.heading2.copyWith(fontSize: isMobile ? 32 : 48),
                      children: [
                        const TextSpan(text: 'A private catalogue of\n'),
                        TextSpan(
                          text: 'extraordinary',
                          style: AppTextStyles.heading2Italic.copyWith(color: AppColors.accentGoldLight),
                        ),
                        const TextSpan(text: ' vessels.'),
                      ],
                    ),
                  ),
                ],
              ),
              if (!isMobile)
                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('VIEW THE FULL FLEET', style: AppTextStyles.buttonText),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward_outlined, size: 16, color: AppColors.primaryNavy),
                    ],
                  ),
                )
            ],
          ),
          const SizedBox(height: 60),
          isMobile
              ? Column(
                  children: [
                    _YachtCard(
                      number: 'Nº 01',
                      category: 'MOTOR YACHT · 52M',
                      name: 'Aurelia',
                      details: '12 GUESTS  |  FROM \$285,000 / WEEK',
                      imageUrl: 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?q=80&w=2070&auto=format&fit=crop',
                    ),
                    const SizedBox(height: 40),
                    _YachtCard(
                      number: 'Nº 02',
                      category: 'SAILING YACHT · 38M',
                      name: 'Solstice',
                      details: '8 GUESTS  |  FROM \$160,000 / WEEK',
                      imageUrl: 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?q=80&w=2070&auto=format&fit=crop',
                    ),
                    const SizedBox(height: 40),
                    _YachtCard(
                      number: 'Nº 03',
                      category: 'EXPLORER · 64M',
                      name: 'Nocturne',
                      details: '14 GUESTS  |  FROM \$420,000 / WEEK',
                      imageUrl: 'https://images.unsplash.com/photo-1605281317010-fe5ffe798166?q=80&w=2044&auto=format&fit=crop',
                    ),
                    const SizedBox(height: 40),
                    _YachtCard(
                      number: 'Nº 04',
                      category: 'CLASSIC MOTOR · 44M',
                      name: 'Belle Époque',
                      details: '10 GUESTS  |  FROM \$220,000 / WEEK',
                      imageUrl: 'https://images.unsplash.com/photo-1559526324-4b87b5e36e44?q=80&w=2070&auto=format&fit=crop',
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          _YachtCard(
                            number: 'Nº 01',
                            category: 'MOTOR YACHT · 52M',
                            name: 'Aurelia',
                            details: '12 GUESTS  |  FROM \$285,000 / WEEK',
                            imageUrl: 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?q=80&w=2070&auto=format&fit=crop',
                          ),
                          const SizedBox(height: 40),
                          _YachtCard(
                            number: 'Nº 03',
                            category: 'EXPLORER · 64M',
                            name: 'Nocturne',
                            details: '14 GUESTS  |  FROM \$420,000 / WEEK',
                            imageUrl: 'https://images.unsplash.com/photo-1605281317010-fe5ffe798166?q=80&w=2044&auto=format&fit=crop',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 80), // Staggered effect
                        child: Column(
                          children: [
                            _YachtCard(
                              number: 'Nº 02',
                              category: 'SAILING YACHT · 38M',
                              name: 'Solstice',
                              details: '8 GUESTS  |  FROM \$160,000 / WEEK',
                              imageUrl: 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?q=80&w=2070&auto=format&fit=crop',
                            ),
                            const SizedBox(height: 40),
                            _YachtCard(
                              number: 'Nº 04',
                              category: 'CLASSIC MOTOR · 44M',
                              name: 'Belle Époque',
                              details: '10 GUESTS  |  FROM \$220,000 / WEEK',
                              imageUrl: 'https://images.unsplash.com/photo-1559526324-4b87b5e36e44?q=80&w=2070&auto=format&fit=crop',
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
        ],
      ),
    );
  }
}

class _YachtCard extends StatelessWidget {
  final String number;
  final String category;
  final String name;
  final String details;
  final String imageUrl;

  const _YachtCard({
    required this.number,
    required this.category,
    required this.name,
    required this.details,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: Text(
                number,
                style: AppTextStyles.buttonText.copyWith(color: AppColors.white),
              ),
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.all(30),
          color: const Color(0xFF5A5C59), // Sage/grey dark background from design
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category, style: AppTextStyles.overline.copyWith(color: AppColors.white.withOpacity(0.5))),
                  const SizedBox(height: 10),
                  Text(name, style: AppTextStyles.heading3.copyWith(color: AppColors.white)),
                  const SizedBox(height: 10),
                  Text(details, style: AppTextStyles.overline.copyWith(color: AppColors.white)),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white.withOpacity(0.5)),
                ),
                child: const Icon(Icons.arrow_forward_ios, color: AppColors.white, size: 14),
              )
            ],
          ),
        )
      ],
    );
  }
}
