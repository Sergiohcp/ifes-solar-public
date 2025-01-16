import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/controllers/auth_controller.dart';
import 'package:ifes_solar/core/theme/custom_image.dart';
import 'package:ifes_solar/core/theme/custom_theme.dart';
import 'package:ifes_solar/widgets/custom_button_widget.dart';
import 'package:ifes_solar/widgets/custom_scaffold_widget.dart';
import 'package:ifes_solar/widgets/custom_text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController authController = Get.find<AuthController>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool shouldShowPassword = false;

  void login(String email, String password) async {
    await authController.login(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      withAppBar: false,
      body: Padding(
        padding: EdgeInsets.only(top: 70, left: 16, right: 16, bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      CustomImage.login,
                      scale: 2,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Email',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                        controller: passwordController,
                        hintText: 'Senha',
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
            ),
            Column(
              children: [
                Obx(
                  () => CustomButton(
                    text: "Entrar",
                    onPressed: () =>
                        login(emailController.text, passwordController.text),
                    isLoading: authController.isAuthLoading,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      variant: CustomButtonVariant.text,
                      text: "Criar conta",
                      onPressed: () {
                        Get.toNamed('/Register');
                      },
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
