import 'package:flutter_supper_app_core/core.dart';

import '../../../common/widgets/responsive_sized_box.dart';
import '../../../common/widgets/responsive_small_text.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.v),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.h,
            backgroundColor: Colors.grey[800],
            child: Icon(Icons.person, size: 40.v, color: Colors.grey[400]),
          ),
          const ResponsiveSizedBox(width: 16),
          const Expanded(
            child: Row(
              children: [
                ResponsiveText(
                  text: 'Đăng nhập/ Đăng ký',
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                Icon(Icons.chevron_right, color: Colors.white, size: 24),
              ],
            ),
          ),
          Icon(Icons.qr_code_scanner, color: Colors.grey[400], size: 24.v),
          const ResponsiveSizedBox(width: 20),
          Icon(Icons.notifications_none, color: Colors.grey[400], size: 24.v),
        ],
      ),
    );
  }
}
