import 'package:abc_cash_and_carry/helper_services/navigation_services.dart';
import 'package:abc_cash_and_carry/providers/item_sub_category_provider.dart';
import 'package:abc_cash_and_carry/screens/item_get_sub_categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubCategoryWrapScreen extends StatefulWidget {
  @override
  _SubCategoryWrapScreenState createState() => _SubCategoryWrapScreenState();
}

class _SubCategoryWrapScreenState extends State<SubCategoryWrapScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemSubCategoryProvider>(builder: (context, data, _) {
      return SizedBox(
        height: 100,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: data.itemSubCategory!.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  NavigationServices.goNextAndKeepHistory(
                      context: context, widget: ItemGetSubCategoriesScreen());
                },
                child: SubCategoryCard(
                    subTitle: data.itemSubCategory![index].subCategory),
              );
            }),
      );

      // List<Widget> widget = [];
      // if (data.itemSubCategory!.isNotEmpty) {
      //   for (int i = 0; i < 10; i++) {
      //     widget.add(InkWell(
      //       onTap: () {
      //         NavigationServices.goNextAndKeepHistory(
      //             context: context,
      //             widget: ItemGetSubCategoriesScreen(
      //               catId: data.itemSubCategory![0].id.toString(),
      //             ));
      //       },
      //       child: SubCategoryCard(
      //         // tile: data.itemSubCategory![0].parentCategoryName,
      //         subTitle: data.itemSubCategory![0].subCategory,
      //       ),
      //     ));
      //   }
      // }
      // data.itemSubCategory!.forEach((element) {
      //   widget.add(SubCategoryCard(
      //     tile: element.subCategory,
      //     subTitle: element.parentCategoryName,
      //   ));
      // });
      // return Align(
      //   alignment: Alignment.center,
      //   child: Wrap(
      //     children: widget,
      //   ),
      // );
    });
  }
}

class SubCategoryCard extends StatefulWidget {
  String? subTitle;

  SubCategoryCard({
    this.subTitle,
  });

  @override
  _SubCategoryCardState createState() => _SubCategoryCardState();
}

class _SubCategoryCardState extends State<SubCategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 150,
        width: MediaQuery.of(context).size.width / 2.5,
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                widget.subTitle!,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
