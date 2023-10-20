// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:suite14/core/components/snackbar/snackbar.dart';
// import 'package:suite14/core/controller/main_controller.dart';
// import 'package:suite14/core/model/user_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:suite14/core/utils/enuns.dart';

// class AuthApi {
//   static const baseApiUrl = 'https://suite.app.br/api';
//   static const baseApiUrlLocal = 'http://localhost:8080/user';
//   static String appChave =
//       Get.find<MainController>().suiteGame == SuiteGame.bebidas
//           ? 'SUITE-51'
//           : 'SUITE-14';

//   Future<UserModel?> login(
//       {required String email, required String senha}) async {
//     String url = '$baseApiUrl/Usuarios/Entrar';

//     http.Response response = await http.post(Uri.parse(url),
//         body: {'email': email, 'senha': senha, 'appChave': appChave});

//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);

//       String status = body['status'];

//       if (status == 'SUCCESS') {
//         UserModel user = UserModel.fromJson(body);
//         getUser(user.token);
//         return user;
//       } else if (status == 'CLIENTE_APP_NOT_MATCHED') {
//         SuiteSnackBar.success(messageText: 'Sucesso!');
//         UserModel user = UserModel.fromJson(body);
//         registrarApp(user.token);
//         getUser(user.token);
//         return user;
//       } else if (status == 'INVALID_PASSWORD') {
//         SuiteSnackBar.warning(messageText: 'SENHA INVÁLIDA');
//         return null;
//       } else if (status == 'USER_BLOCKED') {
//         SuiteSnackBar.error(messageText: 'USUÁRIO BLOQUEADO');
//         return null;
//       } else if (status == 'TOKEN_NOT_CREATED') {
//         SuiteSnackBar.warning(
//             messageText: 'Não foi possível fazer o login, tente novamente');
//         return null;
//       } else if (status == 'EMAIL_NOT_FOUND') {
//         SuiteSnackBar.warning(messageText: 'EMAIL NÃO ENCONTRADO');
//         return null;
//       } else {
//         SuiteSnackBar.error(
//             messageText:
//                 '${response.statusCode} ERRO INESPERADO, TENTE NOVAMENTE MAIS TARDE');
//         return null;
//       }
//     } else {
//       SuiteSnackBar.error(
//           messageText:
//               '${response.statusCode} ERRO INESPERADO, TENTE NOVAMENTE MAIS TARDE');
//       return null;
//     }
//   }

//   Future<bool> registrarApp(token) async {
//     String url = 'https://suite.app.br/api/Clientes/RegistrarApp';

//     http.Response response = await http.post(
//       Uri.parse(url),
//       body: {'token': token, 'appChave': appChave},
//     );

//     if (response.statusCode == 200) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   Future<bool> getUser(token) async {
//     String url = 'https://suite.app.br/api/Usuarios/Detalhes';

//     http.Response response = await http.post(
//       Uri.parse(url),
//       body: {
//         'token': token,
//       },
//     );

//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       UserModel user;
//       user = UserModel.fromJson(body['cliente']);
//       Get.find<MainController>().user.email = user.email;

//       return true;
//     } else {
//       return false;
//     }
//   }

//   Future<bool> register(
//       {required String email,
//       required String senha,
//       required String nome}) async {
//     String url = 'https://suite.app.br/api/Usuarios/Cadastrar';

//     http.Response response = await http.post(Uri.parse(url), body: {
//       'email': email,
//       'senha': senha,
//       'nome': nome,
//       'telefone': '',
//     });

//     if (response.statusCode == 200) {
//       Map<String, dynamic> body =
//           jsonDecode(response.body) as Map<String, dynamic>;

//       String status = body['status'];

//       if (status == 'SUCCESS') {
//         SuiteSnackBar.success(messageText: 'Sucesso ao criar a conta.');

//         return true;
//       } else if (status == 'EMAIL_IN_USE') {
//         SuiteSnackBar.warning(
//             messageText: 'ESSE EMAIL JÁ ESTÁ SENDO UTILIZADO');
//         return false;
//       } else if (status == 'NOT_SAVED') {
//         SuiteSnackBar.warning(
//             messageText: 'Não foi possível criar a conta, tente novamente');
//         return false;
//       } else {
//         SuiteSnackBar.error(
//             messageText:
//                 '$status - ERRO INESPERADO, TENTE NOVAMENTE MAIS TARDE');
//         return false;
//       }
//     } else {
//       SuiteSnackBar.error(
//           messageText:
//               '${response.statusCode} - ERRO INESPERADO, TENTE NOVAMENTE MAIS TARDE');
//       return false;
//     }
//   }

//   Future<bool> recuperarSenha({required String email}) async {
//     String url = '$baseApiUrl/Usuarios/RecuperarSenha';

//     http.Response response =
//         await http.post(Uri.parse(url), body: {'email': email});

//     if (response.statusCode == 200) {
//       Map<String, dynamic> body =
//           jsonDecode(response.body) as Map<String, dynamic>;

//       String status = body['status'];

//       if (status == 'SUCCESS') {
//         SuiteSnackBar.success(messageText: 'Verifique sua caixa de email');

//         return true;
//       } else if (status == 'EMAIL_NOT_FOUND') {
//         SuiteSnackBar.warning(messageText: 'Email não encontrado');
//         return false;
//       } else if (status == 'TOKEN_NOT_CREATED') {
//         SuiteSnackBar.warning(
//             messageText: 'Erro inesperado, tente novamente mais tarde');
//         return false;
//       } else if (status == 'EMAIL_NOT_SENT') {
//         SuiteSnackBar.warning(
//             messageText: 'Erro ao enviar email, tente novamente');
//         return false;
//       } else {
//         SuiteSnackBar.error(
//             messageText:
//                 '${response.statusCode} ERRO INESPERADO, TENTE NOVAMENTE MAIS TARDE');
//         return false;
//       }
//     } else {
//       SuiteSnackBar.error(
//           messageText:
//               '${response.statusCode} ERRO INESPERADO, TENTE NOVAMENTE MAIS TARDE');
//       return false;
//     }
//   }

//   Future<bool> alterarSenha(
//       {required String email,
//       required String token,
//       required String senha}) async {
//     String url = '$baseApiUrl/Usuario/AlterarSenha';

//     http.Response response = await http.post(Uri.parse(url),
//         body: {'email': email, 'token': token, 'senha': senha});

//     if (response.statusCode == 200) {
//       Map<String, dynamic> body =
//           jsonDecode(response.body) as Map<String, dynamic>;

//       String status = body['status'];

//       if (status == 'SUCCESS') {
//         SuiteSnackBar.success(messageText: 'Sucesso ao fazer o login');

//         return true;
//       } else if (status == 'EMAIL_NOT_FOUND') {
//         SuiteSnackBar.warning(messageText: 'Email não encontrado');
//         return false;
//       } else if (status == 'INVALID_TOKEN') {
//         SuiteSnackBar.warning(
//             messageText: 'Erro inesperado, tente novamente mais tarde');
//         return false;
//       } else if (status == 'PASSWORD_NOT_SENT') {
//         SuiteSnackBar.warning(
//             messageText: 'Erro ao salvar senha, tente novamente');
//         return false;
//       } else {
//         SuiteSnackBar.error(
//             messageText: 'ERRO INESPERADO, TENTE NOVAMENTE MAIS TARDE');
//         return false;
//       }
//     } else {
//       SuiteSnackBar.error(
//           messageText: 'ERRO INESPERADO, TENTE NOVAMENTE MAIS TARDE');
//       return false;
//     }
//   }
// }
