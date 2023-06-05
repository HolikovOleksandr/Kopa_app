import 'package:kopa/src/core/ui/widgets/base_statless_widget.dart';
import 'package:kopa/resources/colors.dart';
import 'package:kopa/resources/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleWidget extends BaseStatelessWidget {
  const TitleWidget({
    Key? key,
    required this.text,
    required this.withInput,
    this.controller,
  }) : super(key: key);

  final String text;
  final bool withInput;

  final dynamic controller;

  @override
  Widget getLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                text.tr,
                style: AppFonts.size16.copyWith(
                  color: AppColors.textWhite,
                ),
              )
            ],
          ),
          withInput
              ? SizedBox(
                  height: 40,
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primary,
                          width: 3,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.input,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
