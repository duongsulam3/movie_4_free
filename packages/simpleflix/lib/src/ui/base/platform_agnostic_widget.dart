import 'dart:io';
import 'package:flutter/material.dart';

/// CHÂN LÝ KIẾN TRÚC: Lớp trừu tượng định nghĩa quy chuẩn
/// dựng hình theo từng Platform
abstract class PlatformAgnosticWidget<A extends Widget, I extends Widget>
    extends StatelessWidget {
  const PlatformAgnosticWidget({super.key});

  /// Nhà máy sản xuất Widget theo chuẩn Android (Material Design)
  A buildAndroidWidget(BuildContext context);

  /// Nhà máy sản xuất Widget theo chuẩn iOS (Cupertino Design)
  I buildIOSWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    // Rẽ nhánh tập trung tại một nơi duy nhất ở tầng lõi hệ thống
    if (Platform.isIOS) {
      return buildIOSWidget(context);
    }

    // Mặc định trả về Android/Material cho các nền tảng khác hoặc Android
    return buildAndroidWidget(context);
  }
}
