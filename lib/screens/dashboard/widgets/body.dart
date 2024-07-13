import 'package:commerce/screens/dashboard/controller/index.dart';
import 'package:commerce/widgets/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardBody extends StatefulWidget {
  const DashboardBody({super.key});

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  DashboardController dashboardController = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      return SizedBox(
        height: size.height / 1.46,
        child: ListView.builder(
            itemCount: dashboardController.filteredItems.length,
            itemBuilder: (context, index) {
              final item = dashboardController.filteredItems[index];
              return ProductItem(item: item);
            }),
      );
    });
  }
}
