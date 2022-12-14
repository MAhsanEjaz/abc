import 'package:abc_cash_and_carry/helper_services/custom_loader.dart';
import 'package:abc_cash_and_carry/helper_services/navigation_services.dart';
import 'package:abc_cash_and_carry/providers/cart_items_provider.dart';
import 'package:abc_cash_and_carry/providers/item_sub_category_provider.dart';
import 'package:abc_cash_and_carry/screens/cart_screen.dart';
import 'package:abc_cash_and_carry/services/item_get_sub_categories_service.dart';
import 'package:abc_cash_and_carry/services/sub_category_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/item_get_sub_categories_provider.dart';
import 'item_get_sub_categories_by _id _screen.dart';
import 'item_get_sub_categories_wrap_screen.dart';

class SubCategoryScreen extends StatefulWidget {
  String? text, catId;
  Color? color;

  SubCategoryScreen({this.text, this.catId});

  @override
  _SubCategoryScreenState createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  subCategoryHandler() async {
    CustomLoader.showLoader(context: context);
    await SubCategoryService()
        .getSubGategoriesByCatId(context: context, catId: widget.catId!);
    CustomLoader.hideeLoader(context);
  }

  // ItemSubCategory() {
  //   ItemGetSubCategoriesService().itemGetSubCategories(context: context);
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      subCategoryHandler();
    });
    // ItemSubCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemSubCategoryProvider>(builder: (context, data, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.text!),
          actions: [
            // Consumer<CartItemsProvider>(builder: (context, data, _) {
            //   return Stack(
            //     children: [
            //       IconButton(
            //         onPressed: () {
            //           Navigator.push(context,
            //               MaterialPageRoute(builder: (context) {
            //             return CartScreen();
            //           }));
            //         },
            //         icon: Icon(
            //           Icons.shopping_cart,
            //           color: Colors.green,
            //         ),
            //       ),
            //       Text(
            //         data.cartItems!.length.toString(),
            //         style: TextStyle(color: Colors.red),
            //       ),
            //     ],
            //   );
            // }),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (data.itemSubCategory!.isEmpty)
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 308.0),
                    child: Text('No Category Found'),
                  ))
                else
                  Consumer<ItemSubCategoryProvider>(
                      builder: (context, data, _) {
                    List<Widget> widget = [];
                    data.itemSubCategory!.forEach((element) {
                      widget.add(InkWell(
                        onTap: () async {
                          NavigationServices.goNextAndKeepHistory(
                              context: context,
                              widget: ItemGetBySubCategoryIdScreen(
                                  catId: element.id.toString(),
                                  name: element.subCategory.toString()));
                        },
                        child: SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.height / 4.8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.blue.shade100,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    element.subCategory.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ));
                    });
                    return Align(
                      alignment: Alignment.center,
                      child: Wrap(
                        children: widget,
                      ),
                    );
                  })

                // SizedBox(
                //   height: 220,
                //   width: double.infinity,
                //   child: ListView.builder(
                //       shrinkWrap: true,
                //       scrollDirection: Axis.horizontal,
                //       itemCount: data.itemSubCategory!.length,
                //       itemBuilder: (context, index) {
                //         return InkWell(
                //           onTap: () async {
                //             CustomLoader.showLoader(context: context);
                //             await Future.delayed(Duration(seconds: 5));
                //             CustomLoader.hideeLoader(context);
                //
                //             NavigationServices.goNextAndKeepHistory(
                //                 context: context,
                //                 widget: ItemGetBySubCategoryIdScreen(
                //                   catId: data.itemSubCategory![index].id
                //                       .toString(),
                //                   name: data
                //                       .itemSubCategory![index].subCategory,
                //                 ));
                //           },
                //           child: SizedBox(
                //             height: 100,
                //             width: 200,
                //             child: Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Card(
                //                 color: Colors.blue.shade100,
                //                 elevation: 10,
                //                 shape: RoundedRectangleBorder(
                //                     borderRadius: BorderRadius.circular(10)),
                //                 child: Padding(
                //                   padding: const EdgeInsets.all(8.0),
                //                   child: Center(
                //                     child: Text(
                //                       data.itemSubCategory![index].subCategory
                //                           .toString(),
                //                       style: TextStyle(
                //                           fontWeight: FontWeight.bold,
                //                           fontSize: 17),
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         );
                //       }),
                // ),

                // extra

                // Consumer<ItemGetSubCategoriesProvider>(
                //     builder: (context, data, _) {
                //   return data.getSubCategories!.isEmpty
                //       ? Center(
                //           child: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: CupertinoActivityIndicator(
                //             radius: 14,
                //             animating: true,
                //           ),
                //         ))
                //       : ItemGetSubCategoriesWrapScreenScreen();
                // })
              ],
            ),
          ),
        ),
      );
    });
  }
}

class SubCategoryScreen1 extends StatefulWidget {
  String? text, catId;
  Color? color;

  SubCategoryScreen1({this.text, this.catId});

  @override
  _SubCategoryScreen1State createState() => _SubCategoryScreen1State();
}

class _SubCategoryScreen1State extends State<SubCategoryScreen1> {
  subCategoryHandler() {
    SubCategoryService()
        .getSubGategoriesByCatId(context: context, catId: widget.catId!);
  }

  ItemSubCategory() {
    ItemGetSubCategoriesService().itemGetSubCategories(context: context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subCategoryHandler();
    ItemSubCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemSubCategoryProvider>(builder: (context, data, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.text!),
          actions: [
            // Consumer<CartItemsProvider>(builder: (context, data, _) {
            //   return Stack(
            //     children: [
            //       IconButton(
            //         onPressed: () {
            //           Navigator.push(context,
            //               MaterialPageRoute(builder: (context) {
            //                 return CartScreen();
            //               }));
            //         },
            //         icon: Icon(
            //           Icons.shopping_cart,
            //           color: Colors.green,
            //         ),
            //       ),
            //       Text(
            //         data.cartItems!.length.toString(),
            //         style: TextStyle(color: Colors.red),
            //       ),
            //     ],
            //   );
            // }),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                data.itemSubCategory!.isEmpty
                    ? Container()
                    : SizedBox(
                        height: 120,
                        width: double.infinity,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: data.itemSubCategory!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () async {
                                  CustomLoader.showLoader(context: context);
                                  await Future.delayed(Duration(seconds: 2));
                                  CustomLoader.hideeLoader(context);

                                  NavigationServices.goNextAndKeepHistory(
                                      context: context,
                                      widget: ItemGetBySubCategoryIdScreen1(
                                        catId: data.itemSubCategory![index].id
                                            .toString(),
                                        name: data.itemSubCategory![index]
                                            .subCategory,
                                      ));
                                },
                                child: SizedBox(
                                  height: 100,
                                  width: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      color: Colors.blue.shade100,
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            data.itemSubCategory![index]
                                                .subCategory
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                Consumer<ItemGetSubCategoriesProvider>(
                    builder: (context, data, _) {
                  return data.getSubCategories!.isEmpty
                      ? Center(
                          child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CupertinoActivityIndicator(
                            radius: 20,
                          ),
                        ))
                      : ItemGetSubCategoriesWrapScreen1Screen();
                })
              ],
            ),
          ),
        ),
      );
    });
  }
}
