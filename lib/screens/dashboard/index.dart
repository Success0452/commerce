import 'package:commerce/screens/dashboard/controller/index.dart';
import 'package:commerce/screens/dashboard/widgets/body.dart';
import 'package:commerce/screens/dashboard/widgets/search.dart';
import 'package:commerce/widgets/add_header.dart';
import 'package:commerce/widgets/appbar.dart';
import 'package:commerce/widgets/loader.dart';
import 'package:commerce/widgets/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DashboardController dashboardController = Get.put(DashboardController());

  @override
  void initState() {
    dashboardController.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      bottomSheet: true,
      children: [
        const CustomAppBar(title: 'C o m m e r c e'),
        DashboardSearch(dashboardController: dashboardController),
        AddHeader(title: 'Products', onTap: () {}),
        Obx(() => dashboardController.isLoading.value
            ? const CustomLoader()
            : const DashboardBody()),
      ],
    );
  }
}
