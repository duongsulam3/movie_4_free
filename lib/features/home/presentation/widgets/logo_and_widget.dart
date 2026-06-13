import 'package:flutter_supper_app_core/core.dart';

import '../../../../common/constants/app_constants.dart';
import '../../../../common/widgets/responsive_asset_image.dart';
import 'text_field_change_hint_widget.dart';

class LogoAndWidget extends StatelessWidget {
  const LogoAndWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.v),
      child: Row(
        spacing: 10.v,
        children: [
          const Expanded(
            child: ResponsiveAssetImage(path: AppConstants.appLogo),
          ),
          const TextFieldChangeHint(),
        ],
      ),
    );
  }
}
