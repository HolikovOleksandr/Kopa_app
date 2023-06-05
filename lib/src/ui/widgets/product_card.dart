import 'package:kopa/src/core/ui/widgets/base_statless_widget.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:kopa/src/core/models/product_model.dart';
import 'package:kopa/resources/asset_pathes.dart';
import 'package:kopa/router/route_pathes.dart';
import 'package:kopa/resources/colors.dart';
import 'package:kopa/resources/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProductCardWidget extends BaseStatelessWidget {
  final ProductModel currentProduct;
  final Callback onTab;

  const ProductCardWidget({
    Key? key,
    required this.currentProduct,
    required this.onTab,
  }) : super(key: key);

  @override
  Widget getLayout(context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        InkWell(
          onTap: onTab,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Container(
              width: size.width,
              height: size.height * 0.16,
              decoration: const BoxDecoration(
                color: AppColors.cardBg,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.35,
                    height: size.height,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage(currentProduct.image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentProduct.model,
                        style: AppFonts.size16.copyWith(
                          color: AppColors.textWhite,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'footSizes'.tr,
                        style: AppFonts.size12.copyWith(
                          color: AppColors.textWhite,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                currentProduct.size,
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
                                currentProduct.height,
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
                                currentProduct.width,
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
                      Text(
                        'material'.tr + currentProduct.material,
                        style: AppFonts.size12
                            .copyWith(color: AppColors.sneakerTexture),
                      ),
                      const SizedBox(width: 8),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 16,
          left: 8,
          right: -1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 60,
                child: GestureDetector(
                  onTap: () => Get.toNamed(AppRouter.favoriteScreen),
                  child: SvgPicture.asset(
                    AppIcons.favorite,
                    color: AppColors.textWhite,
                    height: 30,
                    width: 18,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.priceBox,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  "${currentProduct.price}\$",
                  style: AppFonts.size16Bold.copyWith(
                    color: AppColors.cardBg,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
