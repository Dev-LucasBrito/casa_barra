import 'package:app_votacao/context/auth/controller/auth_controller.dart';
import 'package:app_votacao/core/components/buttons/buttons.dart';
import 'package:app_votacao/core/components/inputs/input_with_icon.dart';
import 'package:app_votacao/core/components/logo/logo.dart';
import 'package:app_votacao/core/components/text/text.dart';
import 'package:app_votacao/core/themes/app_themes.dart';
import 'package:app_votacao/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusScopeNode node = FocusScope.of(context);

    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return Scaffold(
            body: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Padding(
                  padding: const EdgeInsets.all(21.0),
                  child: Form(
                    key: controller.signInFormKey,
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppLogo.logo(),
                              const SizedBox(
                                height: 15,
                              ),
                              AppText.textPrimary(text: 'Entre', fontSize: 21),
                              const SizedBox(
                                height: 9,
                              ),
                              AppText.textSecundary(
                                  text: 'Para começar a diversão!'),
                              const SizedBox(
                                height: 33,
                              ),
                              FormInputFieldWithIcon(
                                  controller: controller.emailController,
                                  iconPrefix: Icons.email,
                                  maxLines: 1,
                                  textInputAction: TextInputAction.next,
                                  labelText: 'Email',
                                  inputBorder: InputBorder.none,
                                  keyboardType: TextInputType.emailAddress,
                                  autofocus: false,
                                  validator: (value) {
                                    return null;

                                    // return Validator.cpf(value);
                                  },
                                  onFieldSubmitted: (_) => node.nextFocus(),
                                  onChanged: (_) => {},
                                  onSaved: (_) => {}),
                              const SizedBox(
                                height: 21,
                              ),
                              FormInputFieldWithIcon(
                                labelText: 'Senha',
                                iconPrefix: Icons.lock,
                                minLines: 1,
                                controller: controller.passwordController,
                                validator: (_) => null,
                                onEditingComplete: () {
                                  // controller.setLoginFunction(context);
                                },
                                obscureText: controller.obscureText,
                                newIcon: controller.obscureText
                                    ? FontAwesomeIcons.eyeSlash
                                    : FontAwesomeIcons.eye,
                                hasNewIcon: true,
                                maxLines: 1,
                                iconFunction: () {
                                  controller.setObscureText();
                                },
                                onChanged: (_) {},
                                onSaved: (_) {},
                                textInputAction: TextInputAction.next,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  // Get.put(RecoveryPasswordController());
                                  // AppAlertsDialog.alertOutWidget(
                                  //     context: context,
                                  //     widget: const RecovaryPasswordPage());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    AppText.textSecundary(
                                        text: 'Esqueci minha '),
                                    AppText.textPrimary(
                                        text: 'senha!',
                                        color: AppThemes.pinkSex),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 41,
                              ),
                              Align(
                                  alignment: Alignment.center,
                                  child: AppButtons.buttonWithDisable(
                                      onTap: () {
                                        controller.login(context, false);
                                        Get.offNamed(AppRoutes.home);
                                      },
                                      context: context,
                                      isLoading: controller.isLoadingLogin,
                                      title: 'ENTRAR',
                                      enable: true)),
                              const SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  // Get.toNamed(AppRoutes.register);
                                },
                                child: Center(
                                    child: AppText.textSecundary(
                                        text: 'Ainda não tem uma conta?')),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.register);
                                },
                                child: Center(
                                    child: AppText.textPrimary(
                                  text: 'Criar conta!',
                                )),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  
                                  // Get.toNamed(AppRoutes.register);
                                },
                                child: Center(
                                    child: AppText.textSecundary(
                                        text: 'Está com problemas?')),
                              ),
                              InkWell(
                                onTap: () async {
                                  //  await launchUrlString(
                                  //               'https://wa.me//5561982368005?text=Olá...');
                                },
                                child: Center(
                                    child: AppText.textPrimary(
                                  text: 'Fale com a gente!',
                                )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
