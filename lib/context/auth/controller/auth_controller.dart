import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> recoveryPasswordKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();

  bool obscureText = true;
  bool isLoadingLogin = false;
  bool isLoading = false;
  bool isLoadingInvite = false;
  bool isLoadingNewPass = false;

  int page = 0;

  String token = '';

  setObscureText() {
    obscureText = !obscureText;
    update();
  }

  ///FUNÇÃO PARA FAZER O LOGIN NA APLICAÇÃO
  login(context, bool registred) async {
  //   isLoading = true;
  //   isLoadingLogin = true;
  //   update();

  //   UserModel? user = await AuthApi()
  //       .login(senha: passwordController.text, email: emailController.text);

  //   if (user == null) {
  //     isLoading = false;
  //     isLoadingLogin = false;
  //     update();
  //   } else {
  //     if (registred == true) {
  //       bool registreApp = await AuthApi().registrarApp(user.token);
  //       log(registreApp.toString());
  //       await setUserInMemorie(userModel: user);
  //       await Get.find<MainController>().verifyUserIsLoggedIn();
  //       isLoadingLogin = false;
  //       update();
  //     } else {
  //       await setUserInMemorie(userModel: user);
  //       await Get.find<MainController>().verifyUserIsLoggedIn();
  //       isLoadingLogin = false;
  //       update();
  //     }
  //   }
  }

  // setUserInMemorie({required UserModel userModel}) async {
  //   var prefs = await SharedPreferences.getInstance();
  //   setPlanInMemorie(plan: userModel.plan.toString());
  //   await prefs.setString('user', jsonEncode(userModel.toMap()));
  // }

  // setPlanInMemorie({required String plan}) async {
  //   var prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('p-qwe', plan);
  // }

  setNewValueObscure() {
    obscureText = !obscureText;
    update();
  }

  register(context) async {
    // isLoadingLogin = true;
    // update();
    // bool success = await AuthApi().register(
    //     email: emailController.text,
    //     senha: passwordController.text,
    //     nome: nameController.text);

    // if (success == true) {
    //   login(context, true);
    //   isLoadingLogin = false;
    //   update();
    // }
    // isLoadingLogin = false;
    // update();
  }

  changePass() async {
    // bool success = await AuthApi().recuperarSenha(email: emailController.text);
    // if (success == true) {
    //   page = 1;
    //   update();
    // }
  }

  sendCodeChangePass() async {
    // bool success = await AuthApi().alterarSenha(
    //     email: emailController.text,
    //     senha: passwordController.text,
    //     token: token);
    // if (success == true) {
    //   Get.close(0);
    //   update();
    // }
  }

  ///FUNÇÃO PARA FAZER O LOGIN NA APLICAÇÃO NA ÁREA DE PAGAMENTO
  // loginPayment(context) async {
  //   isLoading = true;
  //   isLoadingLogin = true;
  //   update();

  //   UserModel? user = await AuthApi().login(
  //       senha: passwordController.text,
  //       email: Get.find<MainController>().user.email!);

  //   if (user == null) {
  //     isLoading = false;
  //     isLoadingLogin = false;
  //     update();
  //   } else {
  //     await setUserInMemorie(userModel: user);
  //     isLoadingLogin = false;
  //     Get.find<MainController>().passConfirm = true;
  //    // Get.find<PaymentController>().pass = passwordController.text;
  //     Get.find<MainController>().getUserInMemory();
  //     update();
  //     Get.close(0);
  //     //Get.find<PaymentController>().makePayment();
  //   }
  // }


}
