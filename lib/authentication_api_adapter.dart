import 'dart:convert';
import 'package:agilecrafts_task/user.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'authentication_api_adapter.g.dart';

@JsonSerializable()
@DataRepository([JSONServerTaskAdapter])
class AuthService extends DataModel<AuthService> {
  final String apiUrl = "https://stg-zero.propertyproplus.com.au/api/TokenAuth/Authenticate";

  @override
  final int? id;

  AuthService({this.id});

  Future<String?> authenticate(String username, String password) async {
    final response = await http.post(Uri.parse(apiUrl),
        headers: {
      "Abp.TenantId": "10",
      "Content-Type": "application/json"
    },
        body: jsonEncode({
      "userNameOrEmailAddress": username,
      "password": password
    }));

    if (response.statusCode == 200) {
      print('response body:::${jsonDecode(response.body)}');
      return jsonDecode(response.body);

    } else {
      throw Exception('Failed to authenticate user');
    }
  }
}

mixin JSONServerTaskAdapter on RemoteAdapter<AuthService> {
  @override
  String get baseUrl => 'https://stg-zero.propertyproplus.com.au/api/';

  @override
  String urlForFindAll(Map<String, dynamic> params) => 'TokenAuth/Authenticate';
}

final authService = Provider((_) => AuthService());
final usernameControllerProvider = StateProvider((_) => TextEditingController());
final passwordControllerProvider = StateProvider((_) => TextEditingController());

class LoginPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
     final authservice = ref.watch(authService);
    final usernameController = ref.watch(usernameControllerProvider);
    final passwordController = ref.watch(passwordControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(hintText: 'Username'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                try {
                  final result = await authservice.authenticate(
                      usernameController.text, passwordController.text);
                  // Do something with the result
                  // if(result!=null){
                  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductPage()));
                  // }
                  print('Login successful');
                } catch (e) {
                  // Handle error
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

// final usernameController = use(usernameControllerProvider).state;
// final passwordController = use(passwordControllerProvider).state;
// final authService = ref.watch(Provider((_) => AuthService()));
//
// import 'dart:async';
// import 'dart:convert';
// import 'package:agilecrafts_task/user.dart';
// import 'package:flutter_data/flutter_data.dart';
//
// import 'package:http/http.dart' as http;
//
// import 'package:json_annotation/json_annotation.dart';
//
//
//
// @JsonSerializable()
// class AuthenticationApiAdapter extends RemoteAdapter<User> {
//   @override
//   String get baseUrl => 'https://stg-zero.propertyproplus.com.au/api';
//
//   @override
//   FutureOr<Map<String, String>> get defaultHeaders async {
//     return await super.defaultHeaders & {
//       'Abp.TenantId': '10',
//       'Content-Type': 'application/json',
//     };
//   }
//
//   @override
//   Future<User> authenticateUser(String username, String password) async {
//     final apiUrl = '$baseUrl/TokenAuth/Authenticate';
//
//     final body = {
//       'userNameOrEmailAddress': username,
//       'password': password,
//     };
//
//     final response = await http.post(Uri.parse(apiUrl), headers: await defaultHeaders, body: jsonEncode(body));
//
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       final accessToken = data['result']['accessToken'];
//       final user = User(id: accessToken, username: username, password: password);
//       print('response: $user');
//       return user;
//     } else {
//       throw Exception('Failed to authenticate user');
//     }
//   }
//
//   @override
//   Future<User> findById(String id, {bool remote = true}) async {
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<User> save(User user, {bool remote = true}) async {
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<User?> delete(User user, {bool remote = true}) async {
//     throw UnimplementedError();
//   }
//
// }