import 'package:kopa/resources/asset_pathes.dart';
import 'package:kopa/src/core/ui/widgets/base_statefull_widget.dart';
import 'package:kopa/resources/colors.dart';
import 'package:flutter/material.dart';

class MyProductsPage extends BaseStatefulWidget {
  const MyProductsPage({Key? key}) : super(key: key);

  @override
  State<MyProductsPage> createState() => _MyProductsPageState();
}

class _MyProductsPageState extends State<MyProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              Image.asset(AppImages.simpsonMouth),
            ],
          ),
        ],
      ),
    );
  }
}
