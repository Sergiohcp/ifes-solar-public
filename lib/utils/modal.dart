import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/controllers/user_controller.dart';
import 'package:ifes_solar/core/theme/custom_theme.dart';
import 'package:ifes_solar/utils/toaster.dart';
import 'package:ifes_solar/widgets/custom_button_widget.dart';
import 'package:ifes_solar/widgets/custom_text_field_widget.dart';
import 'package:ifes_solar/widgets/custom_text_widget.dart';

showSaveSimulationModal() {
  final UserController userController = Get.find<UserController>();

  TextEditingController titleController = TextEditingController();

  onConfirm() {
    if (titleController.text.isEmpty) {
      showToaster(
          title: 'Ops!',
          message:
              'É necessário que seja digitado um nome para esta simulação.');
      return;
    }
    userController.saveUserSimulation(titleController.text);
  }

  Get.bottomSheet(
    Padding(
      padding: MediaQuery.of(Get.context!).viewInsets,
      child: Container(
          decoration: BoxDecoration(
            color: CustomTheme.color.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            boxShadow: [
              CustomTheme.shadow.elevation5,
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: Get.back,
                      icon: Icon(
                        Icons.close,
                        size: 20,
                        color: CustomTheme.color.black,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                      "Escolha um nome para esta simulação:",
                      variant: CustomTextVariant.labelLarge,
                      color: 'gray.dark',
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  controller: titleController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 16,
                ),
                Obx(() => CustomButton(
                    text: "Salvar",
                    isLoading: userController.isSaveUserSimulationLoading,
                    onPressed: onConfirm)),
                SizedBox(
                  height: 8,
                ),
                CustomButton(
                    variant: CustomButtonVariant.outlined,
                    text: "Cancelar",
                    onPressed: Get.back),
              ],
            ),
          )),
    ),
    isScrollControlled: true,
    isDismissible: false,
    enableDrag: false,
    backgroundColor: Colors.transparent,
  );
}
