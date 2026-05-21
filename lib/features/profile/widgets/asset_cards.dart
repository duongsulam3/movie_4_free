import 'package:flutter_supper_app_core/core.dart';

import '../../../common/widgets/responsive_small_text.dart';
import '../../../common/widgets/responsive_sized_box.dart';

class AssetCards extends StatelessWidget {
  const AssetCards({super.key});

  static final List<_AssetData> _assets = [
    _AssetData(
      icon: Icons.card_giftcard,
      label: 'Thẻ Quà VIP',
      iconColor: Colors.redAccent,
    ),
    _AssetData(
      icon: Icons.diamond_outlined,
      label: 'Kim Cương của tôi',
      iconColor: Colors.deepPurpleAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.v,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 12.v),
        scrollDirection: Axis.horizontal,
        itemCount: _assets.length,
        separatorBuilder: (context, index) => const ResponsiveSizedBox(
          width: 12,
        ),
        itemBuilder: (context, index) {
          final asset = _assets[index];
          return _buildAssetCard(
            icon: asset.icon,
            label: asset.label,
            iconColor: asset.iconColor,
          );
        },
      ),
    );
  }

  Widget _buildAssetCard({
    required IconData icon,
    required String label,
    required Color iconColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 24.v),
          const ResponsiveSizedBox(width: 8),
          ResponsiveText(
            text: label,
            fontSize: 14,
            textColor: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}

class _AssetData {
  final IconData icon;
  final String label;
  final Color iconColor;

  _AssetData({
    required this.icon,
    required this.label,
    required this.iconColor,
  });
}
