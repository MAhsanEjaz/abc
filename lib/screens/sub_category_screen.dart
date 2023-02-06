import 'package:abc_cash_and_carry/helper_services/custom_loader.dart';
import 'package:abc_cash_and_carry/helper_services/navigation_services.dart';
import 'package:abc_cash_and_carry/helper_widgets/product_item_card.dart';
import 'package:abc_cash_and_carry/providers/filter_provider.dart';
import 'package:abc_cash_and_carry/providers/new_sub_category_provider.dart';
import 'package:abc_cash_and_carry/providers/products_by_category_provider.dart';
import 'package:abc_cash_and_carry/screens/detail_screen.dart';
import 'package:abc_cash_and_carry/services/filter_products_service.dart';
import 'package:abc_cash_and_carry/services/item_get_by_sub_categories_item_service.dart';
import 'package:abc_cash_and_carry/services/sub_category_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({Key? key}) : super(key: key);

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  getNewCategoriesHandler() async {
    CustomLoader.showLoader(context: context);
    await SubCategoryService().getSubGategoriesByCatId(context: context);
    CustomLoader.hideeLoader(context);
  }

  getProductsByCategoryItemsHandler() async {
    CustomLoader.showLoader(context: context);

    await ItemGetBySubCategoryIDService()
        .itemGetBuSubCategoriesService(context: context, id: '1', name: 'Auto');
    CustomLoader.hideeLoader(context);
  }

  filterCategoriesHandler() async {
    CustomLoader.showLoader(context: context);
    await FilterProductsService()
        .filterProductsService(context: context, name: selectItems);
    CustomLoader.hideeLoader(context);
  }

  bool showedProducts = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getProductsByCategoryItemsHandler();
      getNewCategoriesHandler();
      filterCategoriesHandler();
    });
  }

  String? selectItems;

  @override
  Widget build(BuildContext context) {
    return Consumer2<NewSubCategoryProvider, FilterProvider>(
        builder: (context, data, filter, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text(''),
          actions: [
            DropdownButton(
                hint: Text(
                    selectItems == null ? 'Select Subcategory' : selectItems!),
                items: data.category!.map((e) {
                  return DropdownMenuItem(
                      value: e.subCategory,
                      onTap: () async {
                        selectItems = e.subCategory;
                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) async {
                          CustomLoader.showLoader(context: context);
                          await FilterProductsService().filterProductsService(
                              context: context, name: selectItems);
                          showedProducts = true;
                          CustomLoader.hideeLoader(context);
                        });
                        print(selectItems);
                        setState(() {});
                      },
                      child: Text(e.subCategory.toString()));
                }).toList(),
                onChanged: (_) {})
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                showedProducts == true
                    ? Consumer<FilterProvider>(builder: (context, filter, _) {
                        List<Widget> widget = [];
                        filter.products!.forEach((element) {
                          widget.add(InkWell(
                            onTap: () {
                              NavigationServices.goNextAndKeepHistory(
                                  context: context,
                                  widget: ProductDetailScreen(
                                      inventoryItemData: element));
                            },
                            child: ProductItemCard(
                              product: element,
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
                    : Consumer<ProductsByCategoryProvider>(
                        builder: (context, data, _) {
                        List<Widget> widget = [];
                        data.productsByCategory!.forEach((element) {
                          widget.add(InkWell(
                            onTap: () {
                              NavigationServices.goNextAndKeepHistory(
                                  context: context,
                                  widget: ProductDetailScreen(
                                      inventoryItemData: element));
                            },
                            child: ProductItemCard(
                              product: element,
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
              ],
            ),
          ),
        ),
      );
    });
  }
}
