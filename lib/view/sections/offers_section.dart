import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class OffersSection extends StatelessWidget {
  const OffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 1000;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('— SEASONAL OFFERS · 02', style: AppTextStyles.overline.copyWith(color: AppColors.accentGold)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RichText(
                text: TextSpan(
                  style: AppTextStyles.heading2.copyWith(fontSize: isMobile ? 32 : 48),
                  children: [
                    const TextSpan(text: 'Currently sailing at '),
                    TextSpan(
                      text: 'special rates.',
                      style: AppTextStyles.heading2Italic.copyWith(color: AppColors.accentGoldLight),
                    ),
                  ],
                ),
              ),
              if (!isMobile)
                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('ALL CURRENT OFFERS', style: AppTextStyles.buttonText),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward_outlined, size: 16, color: AppColors.primaryNavy),
                    ],
                  ),
                )
            ],
          ),
          const SizedBox(height: 40),
          isMobile
              ? Column(
                  children: [
                    _OfferCard(
                      tag: 'WINTER ESCAPE',
                      title: 'Caribbean · 7-night charters',
                      subtitle: 'UNTIL MARCH 31',
                      badge: '-15%',
                      bgColor: AppColors.secondaryNavy,
                      textColor: AppColors.white,
                    ),
                    const SizedBox(height: 20),
                    _OfferCard(
                      tag: 'HONEYMOON COLLECTION',
                      title: 'Complimentary private chef',
                      subtitle: 'ALL 2026 BOOKINGS',
                      badge: 'Gift',
                      bgColor: AppColors.accentGoldLight,
                      textColor: AppColors.primaryNavy,
                    ),
                    const SizedBox(height: 20),
                    _OfferCard(
                      tag: 'EARLY SUMMER',
                      title: 'Amalfi coast · first week May',
                      subtitle: '4 YACHTS REMAINING',
                      badge: '-10%',
                      bgColor: AppColors.secondaryNavy,
                      textColor: AppColors.white,
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: _OfferCard(
                        tag: 'WINTER ESCAPE',
                        title: 'Caribbean · 7-night charters',
                        subtitle: 'UNTIL MARCH 31',
                        badge: '-15%',
                        bgColor: AppColors.secondaryNavy,
                        textColor: AppColors.white,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _OfferCard(
                        tag: 'HONEYMOON COLLECTION',
                        title: 'Complimentary private chef',
                        subtitle: 'ALL 2026 BOOKINGS',
                        badge: 'Gift',
                        bgColor: AppColors.accentGoldLight,
                        textColor: AppColors.primaryNavy,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _OfferCard(
                        tag: 'EARLY SUMMER',
                        title: 'Amalfi coast · first week May',
                        subtitle: '4 YACHTS REMAINING',
                        badge: '-10%',
                        bgColor: AppColors.secondaryNavy,
                        textColor: AppColors.white,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

class _OfferCard extends StatelessWidget {
  final String tag;
  final String title;
  final String subtitle;
  final String badge;
  final Color bgColor;
  final Color textColor;

  const _OfferCard({
    required this.tag,
    required this.title,
    required this.subtitle,
    required this.badge,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8), // Small radius
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.local_offer_outlined, size: 14, color: textColor),
                  const SizedBox(width: 8),
                  Text(tag, style: AppTextStyles.overline.copyWith(color: textColor, letterSpacing: 2.0)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primaryNavy.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  badge,
                  style: AppTextStyles.heading4.copyWith(color: textColor, fontSize: 18),
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          Text(title, style: AppTextStyles.heading3.copyWith(color: textColor, fontSize: 24)),
          const SizedBox(height: 10),
          Text(subtitle, style: AppTextStyles.overline.copyWith(color: textColor.withOpacity(0.7), fontSize: 8, letterSpacing: 2.0)),
          const SizedBox(height: 60),
          Divider(color: textColor.withOpacity(0.2)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('RESERVE THIS CHARTER', style: AppTextStyles.buttonText.copyWith(color: textColor, fontSize: 10)),
              Icon(Icons.arrow_forward_outlined, size: 14, color: textColor),
            ],
          )
        ],
      ),
    );
  }
}
