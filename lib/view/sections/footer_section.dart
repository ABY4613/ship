import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Container(
      color: AppColors.primaryNavy,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 40 : 80, vertical: 80),
      child: Column(
        children: [
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBrandColumn(),
                    const SizedBox(height: 60),
                    _buildLinksGrid(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: _buildBrandColumn()),
                    const SizedBox(width: 80),
                    Expanded(flex: 3, child: _buildLinksGrid()),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildBrandColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.anchor, color: AppColors.accentGoldLight, size: 28),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Meridian',
                  style: AppTextStyles.heading4.copyWith(
                    color: AppColors.white,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'YACHT CHARTERS',
                  style: AppTextStyles.overline.copyWith(
                    color: AppColors.accentGold,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'A private charter house operating since 1987. Headquartered in\nMonaco, with bureaus in Miami, Split and Phuket.',
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textGrey,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            _socialIcon(FontAwesomeIcons.instagram),
            const SizedBox(width: 16),
            _socialIcon(FontAwesomeIcons.facebookF),
            const SizedBox(width: 16),
            _socialIcon(FontAwesomeIcons.twitter),
            const SizedBox(width: 16),
            _socialIcon(FontAwesomeIcons.youtube),
          ],
        ),
      ],
    );
  }

  Widget _socialIcon(FaIconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white.withOpacity(0.1)),
        borderRadius: BorderRadius.zero,
      ),
      child: Center(
        child: FaIcon(
          icon,
          color: AppColors.textGrey,
          size: 16,
        ),
      ),
    );
  }

  Widget _buildLinksGrid() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLinkColumn('CHARTER', ['Fleet', 'Destinations', 'Itineraries', 'Corporate Events']),
        _buildLinkColumn('COMPANY', ['Our Story', 'Captains & Crew', 'Press', 'Careers']),
        _buildLinkColumn('SUPPORT', ['Contact', 'FAQ', 'Terms', 'Privacy']),
      ],
    );
  }

  Widget _buildLinkColumn(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.overline.copyWith(
            color: AppColors.accentGold,
            letterSpacing: 2.0,
          ),
        ),
        const SizedBox(height: 24),
        ...links.map((link) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: InkWell(
                onTap: () {},
                child: Text(
                  link,
                  style: AppTextStyles.bodySmall.copyWith(color: AppColors.white),
                ),
              ),
            )),
      ],
    );
  }
}
