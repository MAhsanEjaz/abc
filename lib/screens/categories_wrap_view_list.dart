import 'package:abc_cash_and_carry/helper_services/navigation_services.dart';
import 'package:abc_cash_and_carry/helper_widgets/category_card.dart';
import 'package:abc_cash_and_carry/providers/categories_provider.dart';
import 'package:abc_cash_and_carry/screens/sub_category_screen.dart';
import 'package:abc_cash_and_carry/services/categories_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesWrapViewScreen extends StatefulWidget {
  @override
  _CategoriesWrapViewScreenState createState() =>
      _CategoriesWrapViewScreenState();
}

class _CategoriesWrapViewScreenState extends State<CategoriesWrapViewScreen> {
  _getAllCategoriesList() async {
    //CustomLoader.showLoader(context: context);
    bool res = await CategoriesApiServices().getAllCategories(context: context);
    // CustomLoader.hideLoader(context);
    print('getAllCategories -> $res');
  }

  @override
  void initState() {
    super.initState();
    _getAllCategoriesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Consumer<CategoriesProvider>(builder: (context, data, _) {
        if (data.categories!.isEmpty) {
          return Container();
        } else {
          return SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: data.categories!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    NavigationServices.goNextAndKeepHistory(
                        context: context,
                        widget: SubCategoryScreen(
                          // text: data.categories![index].name.toString(),
                          // catId: data.categories![index].id.toString(),
                        ));
                  },
                  child: CategoryCard(
                    color: Colors.primaries[index],
                    category: data.categories![index],
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}

class CategoriesWrapViewScreen1 extends StatefulWidget {
  @override
  _CategoriesWrapViewScreen1State createState() =>
      _CategoriesWrapViewScreen1State();
}

class _CategoriesWrapViewScreen1State extends State<CategoriesWrapViewScreen1> {
  _getAllCategoriesList() async {
    //CustomLoader.showLoader(context: context);
    bool res = await CategoriesApiServices().getAllCategories(context: context);
    // CustomLoader.hideLoader(context);
    print('getAllCategories -> $res');
  }

  @override
  void initState() {
    super.initState();
    _getAllCategoriesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Consumer<CategoriesProvider>(builder: (context, data, _) {
        if (data.categories!.isEmpty) {
          return Container();
        } else {
          return SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: data.categories!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // NavigationServices.goNextAndKeepHistory(
                    //     context: context,
                    //     widget: ProductsGridviewScreen1(
                    //       categorySelected: data.categories![index].name,
                    //     ));
                  },
                  child: CategoryCard(
                    color: Colors.primaries[index],
                    category: data.categories![index],
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}
