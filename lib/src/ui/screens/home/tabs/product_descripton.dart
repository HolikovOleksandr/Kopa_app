import 'package:kopa/src/core/ui/widgets/base_statless_widget.dart';
import 'package:kopa/src/core/models/product_model.dart';
import 'package:kopa/resources/asset_pathes.dart';
import 'package:kopa/router/route_pathes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kopa/resources/colors.dart';
import 'package:kopa/resources/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDescripton extends BaseStatelessWidget  {
  final ProductModel product;

  const ProductDescripton({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget getLayout(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cardBg,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  // BIG IMAGE. IN FUTURE - SLIDER!
                  Container(
                    width: Get.width,
                    height: Get.height * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      image: DecorationImage(
                        image: AssetImage(product.image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  // BACK BUTTON
                  IconButton(
                    onPressed: Get.back,
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.textWhite,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // PRICE CONTAINER
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 5,
                          ),
                          decoration: const BoxDecoration(
                            color: AppColors.priceBox,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Text(
                            "${product.price}\$",
                            style: AppFonts.size16Bold.copyWith(
                              color: AppColors.background,
                            ),
                          ),
                        ),
                        // ADD TO FAVORITE BUTTON
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            AppIcons.favorite,
                            color: AppColors.textWhite,
                            height: 30,
                            width: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.model,
                      style: AppFonts.size22.copyWith(
                        color: AppColors.textWhite,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'footSizes'.tr,
                      style: AppFonts.size12.copyWith(
                        color: AppColors.sneakerTexture,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              product.size,
                              style: AppFonts.size22.copyWith(
                                color: AppColors.primary,
                                wordSpacing: 1,
                              ),
                            ),
                            Text(
                              "countrySize".tr,
                              style: AppFonts.size12.copyWith(
                                color: AppColors.textWhite,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 8),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              product.height,
                              style: AppFonts.size14.copyWith(
                                color: AppColors.textWhite,
                              ),
                            ),
                            Text(
                              'height'.tr,
                              style: AppFonts.size12.copyWith(
                                color: AppColors.textWhite,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 8),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              product.width,
                              style: AppFonts.size14.copyWith(
                                color: AppColors.textWhite,
                              ),
                            ),
                            Text(
                              'width'.tr,
                              style: AppFonts.size12.copyWith(
                                color: AppColors.textWhite,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'material'.tr + product.material,
                      style: AppFonts.size12.copyWith(
                        color: AppColors.sneakerTexture,
                      ),
                    ),
                    const SizedBox(width: 32),
                    Text(
                      product.description,
                      style: AppFonts.size14.copyWith(
                        color: AppColors.sneakerTexture,
                      ),
                    ),
                  ],
                ),
              ),
              // Call to treader space
              Container(
                color: AppColors.descriptionBg,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () => Get.toNamed(AppRouter.userProfile),
                              child: const CircleAvatar(
                                backgroundImage:
                                    AssetImage(AppImages.userPhoto),
                                radius: 30,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Oleksandr",
                                  style: AppFonts.size22Bold.copyWith(
                                    color: AppColors.textWhite,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Львів",
                                  style: AppFonts.size16Bold.copyWith(
                                    color: AppColors.textWhite,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(AppIcons.callButton),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
