import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class BookingSection extends StatelessWidget {
  const BookingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Center(
      child: Container(
        width: isMobile ? size.width * 0.95 : size.width * 0.75,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            )
          ],
        ),
        child: Column(
          children: [
            // Top Tabs
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _tabItem('DAY CHARTER', Icons.sailing, false),
                      const SizedBox(width: 10),
                      _tabItem('WEEKLY VOYAGE', Icons.anchor, true),
                      const SizedBox(width: 10),
                      _tabItem('CORPORATE', Icons.business_center, false),
                    ],
                  ),
                  if (!isMobile)
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: AppColors.accentGold,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text('INSTANT AVAILABILITY', style: AppTextStyles.overline),
                      ],
                    )
                ],
              ),
            ),
            const Divider(height: 1, color: AppColors.dividerColor),
            
            // Input Fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: isMobile
                  ? Column(
                      children: [
                        _inputField('WHERE', 'Amalfi Coast, Italy', Icons.location_on_outlined),
                        const SizedBox(height: 20),
                        _inputField('WHEN', 'dd-mm-yyyy', Icons.calendar_today_outlined),
                        const SizedBox(height: 20),
                        _inputField('WHO', '2 guests', Icons.person_outline),
                        const SizedBox(height: 20),
                        _checkAvailabilityButton(),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(child: _inputField('WHERE', 'Amalfi Coast, Italy', Icons.location_on_outlined)),
                        Container(height: 50, width: 1, color: AppColors.dividerColor),
                        Expanded(child: _inputField('WHEN', 'dd-mm-yyyy', Icons.calendar_today_outlined)),
                        Container(height: 50, width: 1, color: AppColors.dividerColor),
                        Expanded(child: _inputField('WHO', '2 guests', Icons.person_outline)),
                        const SizedBox(width: 20),
                        _checkAvailabilityButton(),
                      ],
                    ),
            ),
            
            // Bottom Info
            const Divider(height: 1, color: AppColors.dividerColor),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('NO BOOKING FEES', style: AppTextStyles.overline.copyWith(color: AppColors.textGrey)),
                      const SizedBox(width: 20),
                      Text('FLEXIBLE CANCELLATION', style: AppTextStyles.overline.copyWith(color: AppColors.textGrey)),
                      const SizedBox(width: 20),
                      if (!isMobile) Text('CONCIERGE INCLUDED', style: AppTextStyles.overline.copyWith(color: AppColors.textGrey)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: AppColors.accentGold, size: 14),
                      const SizedBox(width: 4),
                      Text('4.98 • 2,400+ CHARTERS', style: AppTextStyles.overline.copyWith(color: AppColors.textGrey)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _tabItem(String text, IconData icon, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryNavy : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: isSelected ? AppColors.white : AppColors.textDark),
          const SizedBox(width: 6),
          Text(
            text,
            style: AppTextStyles.buttonText.copyWith(
              color: isSelected ? AppColors.white : AppColors.textDark,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputField(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.backgroundLight,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.textDark, size: 20),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTextStyles.overline.copyWith(color: AppColors.textGrey)),
              const SizedBox(height: 4),
              Text(value, style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
            ],
          )
        ],
      ),
    );
  }

  Widget _checkAvailabilityButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryNavy,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.search, color: AppColors.white, size: 16),
          const SizedBox(width: 8),
          Text('CHECK AVAILABILITY', style: AppTextStyles.buttonText.copyWith(color: AppColors.white)),
        ],
      ),
    );
  }
}
