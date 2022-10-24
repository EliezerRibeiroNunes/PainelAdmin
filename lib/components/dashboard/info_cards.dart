import 'package:painel_richpay/responsive.dart';
import 'package:flutter/material.dart';
import 'package:painel_richpay/colors.dart';

class Cards extends StatelessWidget {
  const Cards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Novo Usuário"),
            ),
          ],
        ),

        //Responsividade do grid de cards informativos
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
          ),
          tablet: FileInfoCardGridView(),
          desktop: FileInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 4,
          ),
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: defaultPadding,
          mainAxisSpacing: defaultPadding,
          childAspectRatio: childAspectRatio,
        ),
        children: [
          Card(
              color: Color.fromARGB(255, 0, 107, 167),
              child: Center(
                  child: Text("Total Usuários:\n1376",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0))),
          ),
          Card(
              color: Color.fromARGB(255, 13, 117, 17),
              child: Center(
                  child: Text("Usuários Ativos:\n 855",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0))),
          ),

            Card(
              color: Color.fromARGB(255, 235, 65, 65),
              child: Center(
                  child: Text("Usuários Inativos:\n 520",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0))),
            ),

        ]);
  }
}
