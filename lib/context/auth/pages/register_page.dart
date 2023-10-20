import 'package:app_votacao/context/auth/controller/auth_controller.dart';
import 'package:app_votacao/core/components/appbar/appbar.dart';
import 'package:app_votacao/core/components/buttons/buttons.dart';
import 'package:app_votacao/core/components/inputs/input_with_icon.dart';
import 'package:app_votacao/core/components/loading/loading.dart';
import 'package:app_votacao/core/components/text/text.dart';
import 'package:app_votacao/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FocusScopeNode node = FocusScope.of(context);

    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppAppBar.appBarBack(onTap: () {
              Get.back();
            }),
            backgroundColor: AppThemes.bgScaffoldDark,
            body: controller.isLoading
                ? AppLoading.appLoadingScaffold(title: 'Criando conta...')
                : Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: Padding(
                        padding: const EdgeInsets.all(21.0),
                        child: Center(
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Form(
                                key: controller.signUpFormKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //CashbackHero.heroContainer(),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    AppText.textPrimary(
                                        text: 'Criar conta', fontSize: 21),
                                    const SizedBox(
                                      height: 9,
                                    ),
                                    AppText.textSecundary(
                                        text:
                                            'Crie uma conta para ter as melhores experiências, com conteúdos personalizados.'),

                                    const SizedBox(
                                      height: 42,
                                    ),
                                    FormInputFieldWithIcon(
                                        controller: controller.nameController,
                                        iconPrefix: Icons.person,
                                        textInputAction: TextInputAction.next,
                                        labelText: 'Nome',
                                        inputBorder: InputBorder.none,
                                        autofocus: false,
                                        validator: (value) {
                                          return null;

                                          //return Validator.name(value);
                                        },
                                        onFieldSubmitted: (_) =>
                                            node.nextFocus(),
                                        onChanged: (_) {},
                                        onSaved: (_) => {}),
                                    const SizedBox(
                                      height: 21,
                                    ),

                                    FormInputFieldWithIcon(
                                        controller: controller.emailController,
                                        iconPrefix: Icons.email,
                                        textInputAction: TextInputAction.next,
                                        labelText: 'E-mail',
                                        inputBorder: InputBorder.none,
                                        maxLines: 1,
                                        autofocus: false,
                                        validator: (value) {
                                          return null;

                                          // return Validator.email(value);
                                        },
                                        onFieldSubmitted: (_) =>
                                            node.nextFocus(),
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
                                    FormInputFieldWithIcon(
                                      labelText: 'Confirme sua senha',
                                      iconPrefix: Icons.lock,
                                      minLines: 1,
                                      controller:
                                          controller.passwordConfirmController,
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
                                      height: 42,
                                    ),

                                    ///Termos de uso e Politicas
                                    Center(
                                      child: AppText.textPrimary(
                                        text:
                                            'Ao inscrever-se, você aceita nossa',
                                        color: AppThemes.primaryText,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: AppText.textButtonUnderline(
                                            text: 'política de privacidade'
                                                .toUpperCase(),
                                            // onPressed: ()=>Modular.to.pushNamed(AppRoutes.termsPrivacyPolicy),
                                            onPressed: () async {
                                              await launchUrlString(
                                                  'https://App14-site.vercel.app/politicas');
                                            },
                                          ),
                                        ),
                                        AppText.textPrimary(
                                          text: 'e',
                                          color: AppThemes.primaryText,
                                          fontSize: 14,
                                        ),
                                        Flexible(
                                          child: AppText.textButtonUnderline(
                                            text: 'termos de uso'.toUpperCase(),
                                            // onPressed: ()=>Modular.to.pushNamed(AppRoutes.termsOfUse),
                                            onPressed: () async {
                                              await launchUrlString(
                                                  'https://App14-site.vercel.app/termos');
                                            },
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(
                                      height: 21,
                                    ),
                                    Align(
                                        alignment: Alignment.center,
                                        child: AppButtons.buttonWithDisable(
                                            enable: true,
                                            onTap: () {
                                              controller.register(context);
                                              //controller.login();
                                              //Get.offNamed(AppRoutes.gamesHome);
                                            },
                                            context: context,
                                            isLoading:
                                                controller.isLoadingLogin,
                                            title: 'CRIAR CONTA')),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          );
        });
  }
}
