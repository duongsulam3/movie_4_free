import 'package:flutter_supper_app_core/core.dart';

import '../../../common/widgets/responsive_sized_box.dart';
import '../../../common/widgets/responsive_small_text.dart';

class VipBanner extends StatelessWidget {
  const VipBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFD194), // Peach/Gold light
            Color(0xFFD1913C), // Peach/Gold dark
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResponsiveText(
                    text: 'Ưu đãi thành viên mới',
                    fontSize: 12,
                    textColor: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                  ResponsiveSizedBox(height: 4),
                  ResponsiveText(
                    text: 'Tháng đầu 23,000 VND',
                    fontSize: 10,
                    textColor: Colors.black54,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.h,
                  vertical: 8.v,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.diamond, color: Colors.black, size: 20),
                    ResponsiveSizedBox(width: 4),
                    ResponsiveText(
                      text: 'Đăng Ký VIP',
                      fontSize: 16,
                      textColor: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: -12.v,
            right: 8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 2.v),
              decoration: BoxDecoration(
                // Orange/Red tag
                color: const Color(0xFFFF5C35),
                borderRadius: BorderRadius.circular(3),
              ),
              child: const ResponsiveText(
                text: 'Ưu đãi đặc biệt',
                fontSize: 10,
                textColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
