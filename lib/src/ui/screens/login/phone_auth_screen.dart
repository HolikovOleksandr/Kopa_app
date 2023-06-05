import 'package:kopa/src/core/controllers/auth_controller.dart';
import 'package:kopa/src/core/ui/widgets/base_statefull_widget.dart';
import 'package:kopa/src/ui/widgets/custome_text_field.dart';
import 'package:kopa/src/ui/widgets/buttons.dart';
import 'package:kopa/resources/asset_pathes.dart';
import 'package:kopa/router/route_pathes.dart';
import 'package:kopa/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneAuthScreen extends BaseStatefulWidget {
  const PhoneAuthScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<PhoneAuthScreen> {
  var authController = Authcontroller();

  LoginScreenState() {
    Get.put(authController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: GetBuilder<Authcontroller>(
        builder: (Authcontroller controller) => SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              Container(
                height: Get.height / 2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.sneaker),
                    scale: 0.9,
                  ),
                ),
              ),
              EnterButtonWidget(onTap: () => Get.toNamed(AppRouter.homeScreen)),
              const SizedBox(height: 40),
              Column(
                children: [
                  CustomeTextField(
                    controller: authController.otpVerifyActive
                        ? authController.otpController
                        : authController.phoneController,
                    obscure: authController.otpVerifyActive ? true : false,
                    hint:
                        authController.otpVerifyActive ? null : 'phoneHint'.tr,
                  ),
                  const SizedBox(height: 10),
                  LongBlueButtonWidget(
                    onPressed: authController.otpVerifyActive
                        ? authController.verifyOTP
                        : authController.loginWithPhone,
                    text: authController.otpVerifyActive
                        ? 'otpButton'.tr
                        : 'phoneButton'.tr,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
