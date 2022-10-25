import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class UsersProviders with ChangeNotifier {
  login() async {
    var http = Dio();

    var response = await http.post('http://richpay-api.herokuapp.com/api/login',
        data: {"email": "teste@teste.com", "password": "123"});
  }

Future<List> getUsers() async {
    var http = Dio();

    var response = await http.get('http://richpay-api.herokuapp.com/api/user',
        options: Options(headers: {
          'Authorization':
              'Bearer Mg.Q-N65X9DmlmyoIomPwo7OWEgiG01E2oXYvXJKx1_C6-LYwHIUMCly93KWu1w'
        }));

    if (response.statusCode == 200){
     return response.data;
    }else {
      throw Exception('Falha ao listar os usuários');
    }

  }
}
