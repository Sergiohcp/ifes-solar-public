import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/core/theme/custom_theme.dart';
import 'package:ifes_solar/models/panel.dart';
import 'package:ifes_solar/widgets/custom_button_widget.dart';
import 'package:ifes_solar/widgets/custom_text_widget.dart';

class PanelsListItem extends StatelessWidget {
  final Panel panel;
  final Panel selectedPanel;
  final void Function(dynamic value) onChanged;

  PanelsListItem(
      {Key? key,
      required this.panel,
      required this.selectedPanel,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => this.onChanged(panel),
      child: Container(
        decoration: BoxDecoration(
          color: CustomTheme.color.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            CustomTheme.shadow.elevation2,
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Radio(
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                activeColor: CustomTheme.color.greenDefault,
                value: panel,
                groupValue: selectedPanel,
                onChanged: onChanged,
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          "**Modelo:** ${panel.name}",
                          color: "gray.default",
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        CustomText("**Fabricante:** ${panel.producer}",
                            color: "gray.default"),
                        SizedBox(
                          height: 4,
                        ),
                        CustomText("**Potência:** ${panel.power} W",
                            color: "gray.default"),
                        SizedBox(
                          height: 4,
                        ),
                        CustomText("**Área:** ${panel.area} m²",
                            color: "gray.default"),
                        CustomText("**Temperatura:** ${panel.temperature} ºC",
                            color: "gray.default"),
                        SizedBox(
                          height: 4,
                        ),
                        CustomText("**PTC:** ${panel.ptc}",
                            color: "gray.default"),
                        SizedBox(
                          height: 4,
                        ),
                        CustomText("**Eficiência:** ${panel.efficiency}",
                            color: "gray.default"),
                      ],
                    ),
                    CustomButton(
                        variant: CustomButtonVariant.text,
                        textPadding: CustomButtonTextPadding.zero,
                        text: "Datasheet",
                        color: CustomTheme.color.greenDefault,
                        withArrow: true,
                        onPressed: () => Get.toNamed('/Datasheet',
                            arguments: panel.datasheet))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
