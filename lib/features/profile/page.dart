import 'package:flutter_supper_app_core/core.dart';

import '../../common/widgets/responsive_sized_box.dart';
import '../../common/widgets/responsive_small_text.dart';
import 'widgets/asset_cards.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_menu_item.dart';
import 'widgets/vip_banner.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0F0F0F), // Deep dark background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(),
              VipBanner(),
              AssetCards(),
              ProfileMenuItem(
                icon: Icons.add,
                label: 'Danh sách phim của tôi',
              ),
              ProfileMenuItem(
                icon: Icons.access_time,
                label: 'Lịch sử xem',
              ),
              ProfileMenuItem(
                icon: Icons.tablet_mac_outlined,
                label: 'Tải TV APP',
                trailingText: 'Free trial',
              ),
              ProfileMenuItem(
                icon: Icons.language,
                label: 'Ngôn ngữ',
              ),
              ProfileMenuItem(
                icon: Icons.subtitles_outlined,
                label: 'Bản dịch phụ đề',
              ),
              ProfileMenuItem(
                icon: Icons.settings_outlined,
                label: 'Cài đặt',
              ),
              ProfileMenuItem(
                icon: Icons.chat_bubble_outline,
                label: 'Phản ánh ý kiến',
              ),
              ResponsiveSizedBox(height: 40),
              Center(
                child: Opacity(
                  opacity: 0.3,
                  child: ResponsiveText(
                    text: 'IQIYI V8.4.0(726952)',
                    fontSize: 12,
                    textColor: Colors.grey,
                  ),
                ),
              ),
              ResponsiveSizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
