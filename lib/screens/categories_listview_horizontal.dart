import 'package:abc_cash_and_carry/helper_services/custom_loader.dart';
import 'package:abc_cash_and_carry/helper_services/navigation_services.dart';
import 'package:abc_cash_and_carry/helper_widgets/category_card.dart';
import 'package:abc_cash_and_carry/providers/categories_provider.dart';
import 'package:abc_cash_and_carry/screens/sub_category_screen.dart';
import 'package:abc_cash_and_carry/services/categories_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'categories_wrap_view_list.dart';

class CategoriesListViewHorizontal extends StatefulWidget {
  @override
  _CategoriesListViewHorizontalState createState() =>
      _CategoriesListViewHorizontalState();
}

class _CategoriesListViewHorizontalState
    extends State<CategoriesListViewHorizontal> {
  _getAllCategoriesList() async {
    // CustomLoader.showLoader(context: context);

    bool res = await CategoriesApiServices().getAllCategories(context: context);
    print('getAllCategories CategoriesListViewHorizontal -> $res');
    // CustomLoader.hideeLoader(context);
  }


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getAllCategoriesList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Consumer<CategoriesProvider>(builder: (context, data, _) {
      if (data.categories!.isEmpty) {
        return Container();
      } else {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: ([
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 0),
                    child: Text(
                      'Categories',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                      onTap: () {
                        NavigationServices.goNextAndKeepHistory(
                            context: context,
                            widget: CategoriesWrapViewScreen());
                      },
                      child: Text('see all')),
                ]),
              ),
            ),
            SizedBox(
                height: 80,
                width: double.infinity,
                child: ListView.builder(
                    // controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: 18,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () async {
                            NavigationServices.goNextAndKeepHistory(
                                context: context,
                                widget: SubCategoryScreen(
                                  catName: data.categories![index].name,
                                  id: data.categories![index].id.toString(),
                                ));
                          },
                          child: CategoryCard(
                            color: Colors.primaries[index].withOpacity(0.5),
                            category: data.categories![index],
                          ));
                    }))
          ],
        );
      }
    }));
  }
}

class CategoriesListViewHorizontal1 extends StatefulWidget {
  @override
  _CategoriesListViewHorizontal1State createState() =>
      _CategoriesListViewHorizontal1State();
}

class _CategoriesListViewHorizontal1State
    extends State<CategoriesListViewHorizontal1> {
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
    return Container(
        child: Consumer<CategoriesProvider>(builder: (context, data, _) {
      if (data.categories!.isEmpty) {
        return Container();
      } else {
        return Column(children: [
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                  ),
                  child: Text(
                    'Categories',
                    style: TextStyle(fontSize: 19),
                  ),
                ),
                // Spacer(),
                // InkWell(
                //     onTap: () {
                //       NavigationServices.goNextAndKeepHistory(
                //           context: context,
                //           widget: CategoriesWrapViewScreen1());
                //     },
                //     child: Text('see all')),
              ])),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              height: 85,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: data.categories!.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        // height: 20,
                        width: 190,
                        child: InkWell(
                            onTap: () {
                              // NavigationServices.goNextAndKeepHistory(
                              //     context: context,
                              //     widget: SubCategoryScreen1(
                              //       text:
                              //           data.categories![index].name.toString(),
                              //       catId:
                              //           data.categories![index].id.toString(),
                              //     )
                              //
                              //     // ProductsGridviewScreen(
                              //     //   categorySelected: data.categories![index].name,
                              //     // )
                              //
                              //     );
                            },
                            child: CategoryCard(
                              color: Colors.primaries[index],
                              category: data.categories![index],
                            )));
                  }))
        ]);
      }
    }));
  }
}
