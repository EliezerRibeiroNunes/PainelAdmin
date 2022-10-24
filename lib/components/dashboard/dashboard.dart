import 'package:painel_richpay/responsive.dart';
import 'package:flutter/material.dart';
import 'package:painel_richpay/colors.dart';
import 'package:painel_richpay/components/dashboard/header.dart';
import 'info_cards.dart';
import 'users_list.dart';

//import 'components/storage_details.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const Cards(),
                      SizedBox(height: defaultPadding),
                      UsersList(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
