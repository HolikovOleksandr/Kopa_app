import 'package:kopa/src/core/ui/widgets/base_statefull_widget.dart';
import 'package:kopa/resources/asset_pathes.dart';
import 'package:kopa/resources/colors.dart';
import 'package:flutter/material.dart';

class FavoritePage extends BaseStatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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
