import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:painel_richpay/colors.dart';
import 'package:dio/dio.dart';

class UsersList extends StatelessWidget {
  UsersList({
    Key? key,
  }) : super(key: key);

  final client = Dio(BaseOptions(baseUrl: "https://randomuser.me/api/"));
  List<dynamic> users = [];

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
          SizedBox(
            width: double.infinity,
            child: ListView.builder(
              itemCount: users.length,
                itemBuilder: (_,index) => ListTile(
                  title: Text(users[index]['name']),
                )
            )
          ),
        ],
      ),
    );
  }

  void listUsers() async{
    final response = await client.get("/user");
    users = response.data;
  }

}

DataTable(
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
label: Text("Cartões"),
),
],
rows: List.generate(titles.length, (index) {

final title = titles[index]['title'];
//final z = users[index];
//final w = users[index];

return DataRow(cells: [
DataCell(Container(child: Text(title))),
//DataCell(Container(child: Text(w))),
//DataCell(Container(child: Text(z)))
]);
}),
),

