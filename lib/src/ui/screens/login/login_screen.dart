import 'package:kopa/src/core/controllers/auth_controller.dart';
import 'package:kopa/src/core/ui/widgets/base_statless_widget.dart';
import 'package:kopa/src/ui/widgets/buttons.dart';
import 'package:kopa/resources/asset_pathes.dart';
import 'package:kopa/router/route_pathes.dart';
import 'package:kopa/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends BaseStatelessWidget {
  final authController = Authcontroller();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget getLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.sneaker),
                scale: 0.9,
              ),
            ),
          ),
          const SizedBox(height: 40),
          EnterButtonWidget(onTap: () => Get.toNamed(AppRouter.homeScreen)),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAuthButton(
                  svgPath: AppIcons.phone,
                  color: AppColors.registerButtonPhone,
                  onTap: () => Get.toNamed(AppRouter.phoneAuthScreen),
                ),
                CircleAuthButton(
                  svgPath: AppIcons.facebook,
                  color: AppColors.registerButtonFacebook,
                  onTap: () {},
                ),
                CircleAuthButton(
                  svgPath: AppIcons.google,
                  color: AppColors.registerButtonGoogle,
                  onTap: () {
                    authController.googleSignIn(context);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
