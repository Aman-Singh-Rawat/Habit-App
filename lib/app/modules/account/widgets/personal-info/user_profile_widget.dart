import 'package:flutter/cupertino.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/values/app_values.dart';
import '../../../widgets/images/app_network_image.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          /// user profile
          AppNetworkImage(
            width: width_150,
            height: width_150,
            imageUrl:
            'https://images.hive.blog/DQmRJLB3rEcRoNuLRn11kBDJjtCQ71PDLRAyEL8qx8yM2qw/TMS06912.jpg',
            borderRadius: BorderRadius.circular(width_150),
          ),
          Positioned(
            bottom: 10,
            right: 2,
            child: Container(
              width: width_32,
              height: height_35,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.all(Radius.circular(radius_6)),
              ),
              child: Center(
                child: Icon(
                  Iconsax.edit_2,
                  size: width_22,
                  color: AppColors.containerColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}