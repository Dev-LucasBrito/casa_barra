import 'package:app_votacao/context/auth/component/content_top.dart';
import 'package:app_votacao/context/auth/controller/auth_controller.dart';
import 'package:app_votacao/core/components/buttons/buttons.dart';
import 'package:app_votacao/core/components/inputs/input_with_icon.dart';
import 'package:app_votacao/core/components/loading/loading.dart';
import 'package:app_votacao/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class RecovaryPasswordPage extends StatelessWidget {
  final bool status;
  const RecovaryPasswordPage({
    Key? key,
    this.status = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return ListView(
            shrinkWrap: true,
            children: [
              Material(
                color: AppThemes.bgCards,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: controller.isLoading
                    ? Center(
                        child: SizedBox(
                            height: 200,
                            width: 100,
                            child: AppLoading.appLoadingScaffold(
                                title: 'Carregando...')),
                      )
                    : Form(
                        key: controller.recoveryPasswordKey,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topRight,
                              padding:
                                  const EdgeInsets.only(right: 14, top: 14),
                              child: TextButton(
                                onPressed: () {
                                  Get.close(0);
                                },
                                child: const Icon(
                                  Icons.close,
                                  size: 28,
                                  color: AppThemes.secundaryText,
                                ),
                              ),
                            ),

                            //CONTEUDO TOPO
                            ContentTopRecoveryPassword(
                              title: controller.page == 1
                                  ? "Instruções enviadas!"
                                  : controller.page == 0
                                      ? status == false
                                          ? "Esqueceu sua senha?"
                                          : "Alterar senha"
                                      : "Nova senha",
                              text: controller.page == 1
                                  ? status == false
                                      ? 'Enviamos um código para o seu email. Digite a baixo o código para recupereção de senha'
                                      : 'Enviamos um código para o seu email. Digite a baixo o código para alterar sua senha'
                                  : controller.page == 0
                                      ? status == false
                                          ? "Informe o EMAIL utilizado no cadastro e enviaremos as instruções para a recuperação da senha."
                                          : "Informe o EMAIL utilizado no cadastro e enviaremos as instruções para a alteração da senha."
                                      : "Insira e confirme sua nova senha.",
                            ),
                            const SizedBox(
                              height: 32,
                            ),

                            ///EMAIL
                            Visibility(
                              visible: controller.page == 0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FormInputFieldWithIcon(
                                  labelText: 'Email',
                                  iconPrefix: Icons.person,
                                  controller: controller.emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    return null;
                                  },
                                  onChanged: (value) {},
                                  onSaved: (_) {},
                                  newIcon: Icons.clear,
                                  hasNewIcon: true,
                                  iconFunction: () =>
                                      controller.emailController.clear(),
                                  textInputAction: TextInputAction.done,
                                ),
                              ),
                            ),

                            //BUTTON PARA ENVIAR EMAIL
                            Visibility(
                              visible: controller.page == 0,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 32, left: 15, right: 15),
                                child: AppButtons.buttonWithDisable(
                                  context: context,
                                  onTap: () {
                                    controller.changePass();
                                    Get.close(0);
                                  },
                                  isLoading: controller.isLoadingInvite,
                                  title: status == false
                                      ? 'recuperar senha'.toUpperCase()
                                      : 'ENVIAR'.toUpperCase(),
                                  enable: true,
                                ),
                              ),
                            ),

                            Visibility(
                                visible: controller.page == 1,
                                child: const SizedBox(
                                  height: 21,
                                )),
                            //BUTTON APOS EMAIL FOR ENVIADO
                            Visibility(
                              visible: controller.page == 1,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 30),
                                  child: PinCodeTextField(
                                    appContext: context,
                                    pastedTextStyle: TextStyle(
                                      color: Colors.green.shade600,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    length: 6,
                                    obscureText: false,
                                    // obscuringCharacter: '*',

                                    blinkWhenObscuring: true,
                                    animationType: AnimationType.fade,
                                    validator: (v) {
                                      return null;

                                      // if (v!.toLowerCase() ==
                                      //     controller.code
                                      //         .toString()
                                      //         .toLowerCase()) {
                                      //   return "Validado";
                                      // } else {
                                      //   return null;
                                      // }
                                    },
                                    pinTheme: PinTheme(
                                      shape: PinCodeFieldShape.box,
                                      borderRadius: BorderRadius.circular(5),
                                      fieldHeight: 50,
                                      fieldWidth: 40,
                                      activeFillColor: Colors.white,
                                      inactiveColor: AppThemes.greyRegular,
                                      disabledColor: AppThemes.greyRegular,
                                      activeColor: AppThemes.pinkSex2,
                                      selectedColor: AppThemes.pinkSex2,
                                      selectedFillColor: AppThemes.pinkSex2,
                                      inactiveFillColor: AppThemes.greyRegular,
                                    ),
                                    cursorColor: Colors.black,
                                    animationDuration:
                                        const Duration(milliseconds: 300),
                                    enableActiveFill: true,
                                    //  errorAnimationController: errorController,
                                    //controller: textEditingController,
                                    keyboardType: TextInputType.text,
                                    boxShadows: const [
                                      BoxShadow(
                                        offset: Offset(0, 1),
                                        color: Colors.black12,
                                        blurRadius: 10,
                                      )
                                    ],
                                    onCompleted: (v) {
                                      // if (v.toLowerCase() ==
                                      //     controller.code
                                      //         .toString()
                                      //         .toLowerCase()) {
                                      //   SystemChannels.textInput.invokeMethod(
                                      //       'TextInput.hide'); //to hide the keyboard - if any

                                      //   controller.setNextPage();
                                      // } else {
                                      //    CashbackSnackBar.snackbarCustom(
                                      //       title: 'Erro',
                                      //       description:
                                      //           'Código inválido',
                                      //       context: context,
                                      //       bgColor: AppThemes.error,
                                      //       textColor: AppThemes.whiteCashback,
                                      //       iconType: 3);

                                      // }
                                    },

                                    onChanged: (value) {},
                                    beforeTextPaste: (text) {
                                      return true;
                                    },
                                  )),
                            ),

                            Visibility(
                              visible: controller.page == 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FormInputFieldWithIcon(
                                  labelText: 'Nova Senha',
                                  iconPrefix: Icons.password_outlined,
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
                              ),
                            ),

                            Visibility(
                                visible: controller.page == 2,
                                child: const SizedBox(
                                  height: 21,
                                )),

                            Visibility(
                              visible: controller.page == 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FormInputFieldWithIcon(
                                  iconPrefix: Icons.password_sharp,
                                  labelText: 'Confirmar Senha',
                                  controller: controller.passwordController,
                                  validator: (value) {
                                    return null;

                                    // Validator()
                                    //   .passwordConfirm(value,
                                    //       controller.passwordController.text)
                                  },
                                  onEditingComplete: () {
                                    SystemChannels.textInput.invokeMethod(
                                        'TextInput.hide'); //to hide the keyboard - if any

                                    // controller.setLoginFunction(context);
                                  },
                                  obscureText: controller.obscureText,
                                  hasNewIcon: true,
                                  newIcon: controller.obscureText
                                      ? FontAwesomeIcons.eyeSlash
                                      : FontAwesomeIcons.eye,
                                  maxLines: 1,
                                  iconFunction: () {
                                    controller.setObscureText();
                                  },
                                  onChanged: (_) {},
                                  onSaved: (_) {},
                                  textInputAction: TextInputAction.done,
                                ),
                              ),
                            ),

                            Visibility(
                                visible: controller.page == 2,
                                child: const SizedBox(
                                  height: 21,
                                )),
                            Visibility(
                              visible: controller.page == 2,
                              child: AppButtons.buttonWithDisable(
                                  enable: true,
                                  onTap: () {
                                    //controller.changePassword(context);
                                  },
                                  isLoading: controller.isLoadingNewPass,
                                  title: 'SALVAR',
                                  context: context),
                            ),

                            const SizedBox(
                              height: 100,
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          );
        });
  }
}
