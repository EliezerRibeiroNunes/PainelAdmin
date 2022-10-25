import 'package:flutter/material.dart';
import 'package:painel_richpay/colors.dart';
import 'package:painel_richpay/providers/users_providers.dart';

class UsersList extends StatelessWidget {
  UsersList({
    Key? key,
  }) : super(key: key);

  Future<List> users = UsersProviders().getUsers();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),

        child: FutureBuilder<List>(
          future: users,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Erro ao carregar usuários'),
              );
            }
            if (snapshot.hasData) {

              return ListView.builder(
                itemCount: snapshot.data!.length,
                  itemBuilder: (context, index){
                  return ListTile(
                      title: Text(snapshot.data![index]['name']),
                  );
                  }

              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}