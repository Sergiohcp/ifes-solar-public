import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/controllers/auth_controller.dart';
import 'package:ifes_solar/core/theme/custom_theme.dart';
import 'package:ifes_solar/validators/valid_string.dart';
import 'package:ifes_solar/widgets/custom_button_widget.dart';
import 'package:ifes_solar/widgets/custom_scaffold_widget.dart';
import 'package:ifes_solar/widgets/custom_text_field_widget.dart';
import 'package:ifes_solar/widgets/custom_text_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthController authController = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool shouldShowPassword = false;

  void register(String username, String email, String password) async {
    await authController.register(username, email, password);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Cadastro',
      withArrow: true,
      body: Padding(
        padding: EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    'Nome:',
                    variant: CustomTextVariant.heading6,
                    color: 'gray.dark',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    controller: nameController,
                    hintText: 'Renato',
                    validator: (String? value) =>
                        validString(value, "Digite um nome válido"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomText(
                    'Email:',
                    variant: CustomTextVariant.heading6,
                    color: 'gray.dark',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    controller: emailController,
                    hintText: 'solar@gmail.com',
                    validator: (String? value) =>
                        validString(value, "Digite um email válido"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomText(
                    'Senha:',
                    variant: CustomTextVariant.heading6,
                    color: 'gray.dark',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                      controller: passwordController,
                      hintText: '********',
                      validator: (String? value) =>
                          validString(value, "Digite uma senha válida"),
                      obscureText: !shouldShowPassword,
                      suffixIcon: IconButton(
                        onPressed: () => setState(
                            () => shouldShowPassword = !shouldShowPassword),
                        icon: Icon(
                          shouldShowPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: CustomTheme.color.grayLight,
                        ),
                      )),
                ],
              ),
            ),
            Obx(
              () => CustomButton(
                text: "Criar conta",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    register(nameController.text, emailController.text,
                        passwordController.text);
                  }
                },
                isLoading: authController.isAuthLoading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
