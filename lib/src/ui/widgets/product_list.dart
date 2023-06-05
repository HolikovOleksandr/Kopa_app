import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopa/resources/colors.dart';
import 'package:kopa/src/core/controllers/product_controllers.dart';
import 'package:kopa/src/ui/screens/home/tabs/product_descripton.dart';
import 'package:kopa/src/ui/widgets/product_card.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key, required this.productController})
      : super(key: key);

  final ProductController productController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => productController.isDataLoadingComplited.value == true
          ? Expanded(
              child: ListView.builder(
                itemCount: productController.products.length,
                itemBuilder: (context, index) {
                  var currentProduct = productController.products[index];
                  return ProductCardWidget(
                    currentProduct: currentProduct,
                    onTab: () => Get.to(
                      () => ProductDescripton(product: currentProduct),
                    ),
                  );
                },
              ),
            )
          : const CircularProgressIndicator(
              color: AppColors.primary,
            ),
    );
  }
}
