import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/controllers/user_controller.dart';
import 'package:ifes_solar/widgets/custom_scaffold_widget.dart';
import 'package:ifes_solar/widgets/custom_text_widget.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();

    return CustomScaffold(
      title: 'Meus dados',
      withArrow: true,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  "Nome: ",
                  variant: CustomTextVariant.label,
                  color: 'green.default',
                ),
                CustomText(
                  userController.user.name,
                  variant: CustomTextVariant.paragraph,
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  "Email: ",
                  variant: CustomTextVariant.label,
                  color: 'green.default',
                ),
                CustomText(
                  userController.user.email,
                  variant: CustomTextVariant.paragraph,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
