import 'package:commerce/screens/dashboard/controller/index.dart';
import 'package:flutter/material.dart';

import '../../../widgets/textfield.dart';

class DashboardSearch extends StatelessWidget {
  final DashboardController dashboardController;
  final TextEditingController? searchQuery;
  const DashboardSearch(
      {super.key, required this.dashboardController, this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: CustomTextField(
        controller: searchQuery,
        hint: 'Search Products',
        prefixIcon: const Icon(Icons.search_outlined, color: Colors.black),
        onChanged: (String query) {
          dashboardController.searchProduct(query);
        },
      ),
    );
  }
}
