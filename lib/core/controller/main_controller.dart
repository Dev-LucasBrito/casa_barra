import 'package:app_votacao/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MainController extends GetxController {
  static MainController to = Get.find();


  int userVotes = 3;


  ///Utilizada para saber se o usuário está logado
  bool isLoggedin = false;

  ///Utilizada para saber se o usuário está logado
  bool passConfirm = false;

  // ///Utilizado para saber quuem é o usuário dono da conta
  // UserModel user = UserModel(token: '', plan: 'FREE');

  ///FUNÇÃO PARA VERIFICAR SE O USUÁRIO ESTÁ LOGADO
  ///ESSA FUNÇÃO QUE DECIDE PARA QUAL PÁGINA O USUÁRIO DEVE IR
  verifyUserIsLoggedIn() async {
    bool hasUserInMemory = await getUserInMemory();

    if (hasUserInMemory) {
      if (!kIsWeb) {
       
      } else {
        if (Uri.base.toString().contains('/auth/login')) {
          Get.offAllNamed(AppRoutes.splash);
          Future.delayed(const Duration(seconds: 1), () {
            verifyUserIsLoggedIn();
          });
        } else if (Uri.base.toString().contains('/success') ||
            Uri.base.toString().contains('/failure') ||
            Uri.base.toString().contains('/home')) {
        } else if (Uri.base.toString().contains('/splash') ||
            Uri.base.toString().contains('/')) {
          
        }
      }
    } else {
       if (Uri.base.toString().contains('/auth/login')) {
          Get.offAllNamed(AppRoutes.splash);
          Future.delayed(const Duration(seconds: 1), () {
            verifyUserIsLoggedIn();
          });
        }else{
                // Get.offAllNamed(AppRoutes.teste);
      Get.offAllNamed(AppRoutes.login);
        }

    }
  }

  ///FUNÇÃO PARA VERIFICAR SE EXISTE UM USUÁRIO SALVO NO ARMAZENAMENTO INTERNO
  ///CASO EXISTA UM USUÁRIO, ESSA FUNÇÃO VAI SETARR NO USERMODEL OS DADOS SALVOS
  Future<bool> getUserInMemory() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('user') != null) {
      // var u = jsonDecode(prefs.getString('user')!);
      // UserModel userModel = UserModel.fromJson(u);
      // user = userModel;
      update();
      return true;
    } else {
      return false;
    }
  }

  ///Função utilizada para sair do aplicativo
  signout() async {
    await removeUserInMemorie();
    await verifyUserIsLoggedIn();
  }

  ///Função utilizada para remover o usuário da memória
  removeUserInMemorie() async {
    var prefs = await SharedPreferences.getInstance();

    await prefs.remove('user');
  }

  @override
  void onReady() async {
    await verifyUserIsLoggedIn();
    //signout();
    super.onReady();
  }
}
