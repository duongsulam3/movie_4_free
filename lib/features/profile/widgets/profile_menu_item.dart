import 'package:flutter/material.dart';
import 'package:flutter_supper_app_core/core.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';

class ProfileMenuItem extends StatelessWidget {
  final Widget? leading;
  final IconData? icon;
  final String label;
  final String? trailingText;
  final bool showDivider;

  const ProfileMenuItem({
    super.key,
    this.leading,
    this.icon,
    required this.label,
    this.trailingText,
    this.showDivider = false,
  });

  static const Color iconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.v, horizontal: 8.h),
      child: Row(
        children: [
          SizedBox(
            width: 24.h,
            child: _buildIcon(),
          ),
          const ResponsiveSizedBox(width: 16),
          Expanded(
            child: ResponsiveText(
              text: label,
              fontSize: 16,
              textColor: Colors.white.withValues(alpha: 0.9),
              fontWeight: FontWeight.w400,
            ),
          ),
          if (trailingText != null) ...[
            ResponsiveText(
              text: trailingText!,
              fontSize: 12,
              textColor: Colors.grey.shade600,
            ),
            const ResponsiveSizedBox(width: 4),
            const Icon(
              Icons.chevron_right,
              color: iconColor,
              size: 16,
            ),
          ],
        ],
      ),
    );
  }

  Widget? _buildIcon() {
    return icon != null
        ? Icon(icon, color: iconColor, size: 24.fSize)
        : leading;
  }
}
