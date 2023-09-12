// import 'package:flutter_data/flutter_data.dart';
// import 'package:http/http.dart' as http;
// import 'package:json_annotation/json_annotation.dart';
// part 'user.g.dart';
//
// @JsonSerializable()
// class User extends DataModel<User>{
//   @override
//   final int id;
//   final String username;
//   final String password;
//   User({required this.id, required this.username, required this.password});
//   //factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
//  // Map<String, dynamic> toJson() => _$UserToJson(this);
// }

import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('product page'),),
    );
  }
}
