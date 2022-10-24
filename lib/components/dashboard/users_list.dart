import 'package:flutter/material.dart';
import 'package:painel_richpay/colors.dart';

class UsersList extends StatelessWidget {
  UsersList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Usuários",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox (
            width: double.infinity,
            child: DataTable(
              columnSpacing: defaultPadding,
              columns: [
                DataColumn(
                  label: Text("Nome"),
                ),
                DataColumn(
                  label: Text("Criado em"),
                ),
                DataColumn(
                  label: Text("Status"),
                ),
                DataColumn(
                  label: Text("Ultimo acesso"),
                ),
              ], rows: [],
              //rows: List.generate(
              //users.length,
              //(index) => recentFileDataRow(users[index]),
            ),
          ),
        ],
      ),
    );
  }
}