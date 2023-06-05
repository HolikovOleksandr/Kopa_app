import 'package:kopa/resources/fonts.dart';
import 'package:kopa/src/core/ui/widgets/base_statless_widget.dart';
import 'package:kopa/src/core/controllers/product_controllers.dart';
import 'package:kopa/src/ui/widgets/product_list.dart';
import 'package:kopa/resources/asset_pathes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kopa/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

import 'package:kopa/src/ui/widgets/title_widget.dart';

class HomePage extends BaseStatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());

  @override
  Widget getLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    IconButton(
                      onPressed: () {
                        soartBottomSheet(context);
                      },
                      icon: SvgPicture.asset(
                        AppIcons.soart,
                        fit: BoxFit.scaleDown,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(AppImages.simpsonMouth),
            ],
          ),
          ProductList(productController: productController)
        ],
      ),
    );
  }

  soartBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: Get.height * 0.8,
          decoration: const BoxDecoration(
            color: AppColors.cardBg,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Transform.rotate(
                    angle: pi * 3.5,
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 40,
                    ),
                  ),
                ),
                const TitleWidget(text: 'model', withInput: true),
                const TitleWidget(text: 'material', withInput: true),
                const TitleWidget(text: 'size', withInput: true),
                const TitleWidget(text: 'price', withInput: true),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'cancel'.tr.toUpperCase(),
                        style: AppFonts.size14.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 29),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'apply'.tr.toUpperCase(),
                        style: AppFonts.size14.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
