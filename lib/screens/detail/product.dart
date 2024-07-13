import 'package:commerce/models/product.dart';
import 'package:commerce/screens/detail/widgets/item.dart';
import 'package:commerce/widgets/wrapper.dart';
import 'package:flutter/material.dart';

import '../../widgets/add_header.dart';
import '../../widgets/appbar.dart';

class DetailsScreen extends StatefulWidget {
  final ProductModel productModel;
  const DetailsScreen({super.key, required this.productModel});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(children: [
      const CustomAppBar(title: 'Product Details', enablePrev: true),
      AddHeader(title: 'Details', label: 'Update', onTap: () {}),
      DetailsItem(
        item: widget.productModel,
      )
    ]);
  }
}
