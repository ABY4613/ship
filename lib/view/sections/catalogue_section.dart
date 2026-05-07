import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class CatalogueSection extends StatelessWidget {
  const CatalogueSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80, vertical: 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RichText(
                text: TextSpan(
                  style: AppTextStyles.heading2.copyWith(fontSize: isMobile ? 32 : 48),
                  children: [
                    const TextSpan(text: 'A private catalogue of\n'),
                    TextSpan(
                      text: 'extraordinary',
                      style: AppTextStyles.heading2Italic,
                    ),
                    const TextSpan(text: ' vessels.'),
                  ],
                ),
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
                      number: 'No 01',
                      category: 'EXPLORER · 64M',
                      name: 'Nocturne',
                      details: '14 GUESTS  |  FROM \$420,000 / WEEK',
                      imageUrl: 'https://images.unsplash.com/photo-1605281317010-fe5ffe798166?q=80&w=2044&auto=format&fit=crop',
                    ),
                    const SizedBox(height: 40),
                    _YachtCard(
                      number: 'No 02',
                      category: 'CLASSIC MOTOR · 44M',
                      name: 'Belle Époque',
                      details: '10 GUESTS  |  FROM \$220,000 / WEEK',
                      imageUrl: 'https://images.unsplash.com/photo-1559526324-4b87b5e36e44?q=80&w=2070&auto=format&fit=crop',
                    ),
                    const SizedBox(height: 40),
                    _YachtCard(
                      number: 'No 03',
                      category: 'MOTOR YACHT · 52M',
                      name: 'Aurelia',
                      details: '12 GUESTS  |  FROM \$285,000 / WEEK',
                      imageUrl: 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?q=80&w=2070&auto=format&fit=crop',
                    ),
                    const SizedBox(height: 40),
                    _YachtCard(
                      number: 'No 04',
                      category: 'SAILING YACHT · 38M',
                      name: 'Solstice',
                      details: '8 GUESTS  |  FROM \$160,000 / WEEK',
                      imageUrl: 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?q=80&w=2070&auto=format&fit=crop',
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
                            number: 'No 01',
                            category: 'EXPLORER · 64M',
                            name: 'Nocturne',
                            details: '14 GUESTS  |  FROM \$420,000 / WEEK',
                            imageUrl: 'https://images.unsplash.com/photo-1605281317010-fe5ffe798166?q=80&w=2044&auto=format&fit=crop',
                          ),
                          const SizedBox(height: 60),
                          _YachtCard(
                            number: 'No 03',
                            category: 'MOTOR YACHT · 52M',
                            name: 'Aurelia',
                            details: '12 GUESTS  |  FROM \$285,000 / WEEK',
                            imageUrl: 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?q=80&w=2070&auto=format&fit=crop',
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
                              number: 'No 02',
                              category: 'CLASSIC MOTOR · 44M',
                              name: 'Belle Époque',
                              details: '10 GUESTS  |  FROM \$220,000 / WEEK',
                              imageUrl: 'https://images.unsplash.com/photo-1559526324-4b87b5e36e44?q=80&w=2070&auto=format&fit=crop',
                            ),
                            const SizedBox(height: 60),
                            _YachtCard(
                              number: 'No 04',
                              category: 'SAILING YACHT · 38M',
                              name: 'Solstice',
                              details: '8 GUESTS  |  FROM \$160,000 / WEEK',
                              imageUrl: 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?q=80&w=2070&auto=format&fit=crop',
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
          color: AppColors.textDark, // Dark grey background for banner
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category, style: AppTextStyles.overline),
                  const SizedBox(height: 10),
                  Text(name, style: AppTextStyles.heading3.copyWith(color: AppColors.white)),
                  const SizedBox(height: 10),
                  Text(details, style: AppTextStyles.bodySmall.copyWith(color: AppColors.white.withOpacity(0.7))),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white.withOpacity(0.5)),
                ),
                child: const Icon(Icons.arrow_outward, color: AppColors.white, size: 20),
              )
            ],
          ),
        )
      ],
    );
  }
}
