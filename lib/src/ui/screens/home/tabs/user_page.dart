import 'package:kopa/src/core/ui/widgets/base_statless_widget.dart';
import 'package:kopa/src/core/controllers/local_controller.dart';
import 'package:kopa/src/ui/widgets/buttons.dart';
import 'package:kopa/resources/asset_pathes.dart';
import 'package:kopa/router/route_pathes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kopa/resources/colors.dart';
import 'package:kopa/resources/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends BaseStatelessWidget {
  static final localeController = LocalController();

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget getLayout(context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          Image.asset(AppImages.simpsonMouth),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
            child: Column(
              children: [
                Row(
                  children: [
                    const UserImage(),
                    const SizedBox(width: 16),
                    Text(
                      'userName'.tr,
                      style: AppFonts.size22Bold.copyWith(
                        color: AppColors.textWhite,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 32),
                UserInformationRow(
                  info: 'number'.tr,
                  title: 'phone'.tr,
                ),
                const SizedBox(height: 32),
                UserInformationRow(
                  info: 'Львів',
                  title: 'location'.tr,
                ),
                const SizedBox(height: 44),
                LongBlueButtonWidget(
                  text: 'exed'.tr,
                  onPressed: () => Get.toNamed(AppRouter.loginScreen),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.language),
        onPressed: () => localeController.buildDialog(context),
      ),
    );
  }
}

// Widget with infomation about user
class UserInformationRow extends BaseStatelessWidget {
  final String title;
  final String info;

  const UserInformationRow({
    required this.title,
    required this.info,
    Key? key,
  }) : super(key: key);

  @override
  Widget getLayout(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppFonts.size14.copyWith(
              color: AppColors.textWhite,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            info,
            style: AppFonts.size18.copyWith(
              color: AppColors.textWhite,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            color: AppColors.cardBg,
            width: double.infinity,
            height: 2,
          ),
        ],
      ),
    );
  }
}

// User avatar
class UserImage extends StatelessWidget {
  const UserImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(AppImages.userPhoto),
          radius: 45,
        ),
        AddUserPhotoButton(),
      ],
    );
  }
}

// Add photo button
class AddUserPhotoButton extends StatelessWidget {
  const AddUserPhotoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.all(Radius.circular(500)),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(AppIcons.add),
        ),
      ],
    );
  }
}
