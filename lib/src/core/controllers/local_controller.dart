import 'package:kopa/src/core/controllers/base_controller.dart';
import 'package:kopa/resources/colors.dart';
import 'package:kopa/resources/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends BaseController {
  final List locals = [
    {'name': 'English', 'locale': const Locale('en')},
    {'name': 'Українська', 'locale': const Locale('uk')},
  ];

  buildDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          backgroundColor: AppColors.cardBg,
          title: Text(
            'Chose a language',
            style: AppFonts.size16Bold.copyWith(
              color: AppColors.textWhite,
            ),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      updateLanguage(locals[index]['locale']);
                    },
                    child: Text(
                      locals[index]['name'],
                      style: AppFonts.size14.copyWith(
                        color: AppColors.textWhite,
                      ),
                    ),
                  ),
                );
              },
              itemCount: locals.length,
              separatorBuilder: (context, index) {
                return const Divider(color: AppColors.primary);
              },
            ),
          ),
        );
      },
    );
  }

  updateLanguage(Locale local) {
    Get.back();
    Get.updateLocale(local);
  }
}
