import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class AvailableNowSection extends StatelessWidget {
  const AvailableNowSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 1000;

    return Container(
      color: AppColors.backgroundLight,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('— AVAILABLE NOW · DUBAI HARBOUR', style: AppTextStyles.overline.copyWith(color: AppColors.accentGold, letterSpacing: 2.0)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: AppTextStyles.heading2.copyWith(fontSize: isMobile ? 32 : 48),
                    children: [
                      const TextSpan(text: 'Step aboard today — at '),
                      TextSpan(
                        text: 'half the rate.',
                        style: AppTextStyles.heading2Italic.copyWith(color: AppColors.accentGoldLight),
                      ),
                    ],
                  ),
                ),
              ),
              if (!isMobile)
                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('BROWSE ALL YACHTS', style: AppTextStyles.buttonText),
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
                      name: '“KAMI”',
                      brand: 'AZIMUT',
                      rating: '4.9',
                      feet: '53',
                      guests: '15',
                      cabins: '3',
                      crew: '3',
                      desc: 'Premium 53ft Double-Deck Yacht Charter Dubai | 2023 Refit | Dubai Harbour',
                      price: '600',
                      oldPrice: '1,200',
                      imageUrl: 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?q=80&w=2070&auto=format&fit=crop',
                    ),
                    const SizedBox(height: 40),
                    _YachtCard(
                      name: '“NIKA”',
                      brand: 'SKY',
                      rating: '5.0',
                      feet: '52',
                      guests: '15',
                      cabins: '2',
                      crew: '3',
                      desc: 'Premium 52ft Double-Deck Yacht Charter Dubai | 2025 Refit | Dubai Harbour',
                      price: '750',
                      oldPrice: '1,500',
                      imageUrl: 'https://images.unsplash.com/photo-1559526324-4b87b5e36e44?q=80&w=2070&auto=format&fit=crop',
                    ),
                    const SizedBox(height: 40),
                    _YachtCard(
                      name: '“VERONIKA”',
                      brand: 'MAJESTY',
                      rating: '4.9',
                      feet: '55',
                      guests: '19',
                      cabins: '3',
                      crew: '3',
                      desc: 'Premium 55ft Majesty Yacht Charter Dubai | 2023 Refit | Dubai Harbour',
                      price: '850',
                      oldPrice: '1,700',
                      imageUrl: 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?q=80&w=2070&auto=format&fit=crop',
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: _YachtCard(
                        name: '“KAMI”',
                        brand: 'AZIMUT',
                        rating: '4.9',
                        feet: '53',
                        guests: '15',
                        cabins: '3',
                        crew: '3',
                        desc: 'Premium 53ft Double-Deck Yacht Charter Dubai | 2023 Refit | Dubai Harbour',
                        price: '600',
                        oldPrice: '1,200',
                        imageUrl: 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?q=80&w=2070&auto=format&fit=crop',
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: _YachtCard(
                        name: '“NIKA”',
                        brand: 'SKY',
                        rating: '5.0',
                        feet: '52',
                        guests: '15',
                        cabins: '2',
                        crew: '3',
                        desc: 'Premium 52ft Double-Deck Yacht Charter Dubai | 2025 Refit | Dubai Harbour',
                        price: '750',
                        oldPrice: '1,500',
                        imageUrl: 'https://images.unsplash.com/photo-1559526324-4b87b5e36e44?q=80&w=2070&auto=format&fit=crop',
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: _YachtCard(
                        name: '“VERONIKA”',
                        brand: 'MAJESTY',
                        rating: '4.9',
                        feet: '55',
                        guests: '19',
                        cabins: '3',
                        crew: '3',
                        desc: 'Premium 55ft Majesty Yacht Charter Dubai | 2023 Refit | Dubai Harbour',
                        price: '850',
                        oldPrice: '1,700',
                        imageUrl: 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?q=80&w=2070&auto=format&fit=crop',
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

class _YachtCard extends StatelessWidget {
  final String name;
  final String brand;
  final String rating;
  final String feet;
  final String guests;
  final String cabins;
  final String crew;
  final String desc;
  final String price;
  final String oldPrice;
  final String imageUrl;

  const _YachtCard({
    required this.name,
    required this.brand,
    required this.rating,
    required this.feet,
    required this.guests,
    required this.cabins,
    required this.crew,
    required this.desc,
    required this.price,
    required this.oldPrice,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        children: [
          // Image and Badges
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  imageUrl,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 16,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  color: const Color(0xFFF04B4B), // Red badge
                  child: Text('-50% OFF', style: AppTextStyles.buttonText.copyWith(color: AppColors.white, fontSize: 10)),
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  color: AppColors.primaryNavy,
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: AppColors.accentGoldLight, size: 12),
                      const SizedBox(width: 4),
                      Text(rating, style: AppTextStyles.buttonText.copyWith(color: AppColors.white, fontSize: 10)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          
          // Details
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(width: 8, height: 8, decoration: const BoxDecoration(color: Color(0xFF32D583), shape: BoxShape.circle)),
                    const SizedBox(width: 8),
                    Text('AVAILABLE NOW', style: AppTextStyles.overline.copyWith(color: AppColors.textGrey, letterSpacing: 1.5)),
                  ],
                ),
                const SizedBox(height: 24),
                Text(name, style: AppTextStyles.heading3.copyWith(fontSize: 28)),
                const SizedBox(height: 8),
                Container(width: 40, height: 1, color: AppColors.textGrey.withOpacity(0.3)),
                const SizedBox(height: 8),
                Text(brand, style: AppTextStyles.overline.copyWith(color: AppColors.textGrey, letterSpacing: 3.0)),
                
                const SizedBox(height: 24),
                
                // Stats
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    border: Border.symmetric(horizontal: BorderSide(color: AppColors.textGrey.withOpacity(0.2))),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _stat(feet, 'FEET'),
                      _divider(),
                      _stat(guests, 'GUESTS'),
                      _divider(),
                      _stat(cabins, 'CABINS'),
                      _divider(),
                      _stat(crew, 'CREW'),
                    ],
                  ),
                ),
                
                const SizedBox(height: 16),
                Text(
                  desc,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodySmall.copyWith(color: AppColors.textGrey, fontSize: 10),
                ),
                
                const SizedBox(height: 24),
                
                // Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('AED $price ', style: AppTextStyles.heading3.copyWith(fontSize: 24)),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text('/ hour ', style: AppTextStyles.bodySmall.copyWith(color: AppColors.textGrey)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        'AED $oldPrice',
                        style: AppTextStyles.buttonText.copyWith(
                          color: const Color(0xFFF04B4B),
                          decoration: TextDecoration.lineThrough,
                          decorationColor: const Color(0xFFF04B4B),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text('*MINIMUM 1 HOUR', style: AppTextStyles.overline.copyWith(color: AppColors.textGrey, fontSize: 8)),
                
                const SizedBox(height: 24),
                
                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          side: BorderSide(color: AppColors.textGrey.withOpacity(0.3)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FaIcon(FontAwesomeIcons.whatsapp, size: 14, color: AppColors.primaryNavy),
                            const SizedBox(width: 8),
                            Text('WHATSAPP', style: AppTextStyles.buttonText),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          side: BorderSide(color: AppColors.textGrey.withOpacity(0.3)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text('VIEW DETAILS', style: AppTextStyles.buttonText),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _stat(String val, String label) {
    return Column(
      children: [
        Text(val, style: AppTextStyles.heading4.copyWith(color: AppColors.primaryNavy, fontSize: 22)),
        const SizedBox(height: 4),
        Text(label, style: AppTextStyles.overline.copyWith(color: AppColors.textGrey, fontSize: 8, letterSpacing: 1.5)),
      ],
    );
  }

  Widget _divider() {
    return Container(width: 1, height: 30, color: AppColors.textGrey.withOpacity(0.2));
  }
}
