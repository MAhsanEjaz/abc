import 'package:flutter/material.dart';

import '../services/item_get_sub_categories_service.dart';
import 'item_get_sub_categories_wrap_screen.dart';

class ItemGetSubCategoriesScreen extends StatefulWidget {



  @override
  _ItemGetSubCategoriesScreenState createState() =>
      _ItemGetSubCategoriesScreenState();
}

class _ItemGetSubCategoriesScreenState
    extends State<ItemGetSubCategoriesScreen> {


  getItemSubCategories() {
    ItemGetSubCategoriesService().itemGetSubCategories(context: context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getItemSubCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ItemGetSubCategoriesWrapScreenScreen(),
      ),
    );
  }
}
