import 'package:kopa/src/core/ui/widgets/base_statless_widget.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:kopa/resources/asset_pathes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kopa/resources/colors.dart';
import 'package:kopa/resources/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Enter button
class EnterButtonWidget extends BaseStatelessWidget {
  final Callback onTap;

  const EnterButtonWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget getLayout(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(AppImages.enterButton),
        TextButton(
          onPressed: onTap,
          child: Text(
            'enter'.tr,
            style: AppFonts.size26.copyWith(
              color: AppColors.textWhite,
            ),
          ),
        ),
      ],
    );
  }
}

// Long blue button
class LongBlueButtonWidget extends BaseStatelessWidget {
  final Callback onPressed;
  final String text;
  const LongBlueButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget getLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          text,
          style: AppFonts.size16.copyWith(
            color: AppColors.textWhite,
          ),
        ),
      ),
    );
  }
}

// Register button
class CircleAuthButton extends BaseStatelessWidget {
  final String svgPath;
  final Callback onTap;
  final Color color;

  const CircleAuthButton({
    Key? key,
    required this.svgPath,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  @override
  Widget getLayout(BuildContext context) {
    return Container(
      decoration: _buttonRegisterStyle(color),
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.17,
      child: GestureDetector(
        onTap: onTap,
        child: SvgPicture.asset(
          svgPath,
          fit: BoxFit.scaleDown,
          height: 25,
          width: 25,
        ),
      ),
    );
  }

  _buttonRegisterStyle(Color color) {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: color,
      boxShadow: [
        BoxShadow(
          spreadRadius: 1,
          blurRadius: 25,
          color: color,
        ),
      ],
    );
  }
}
