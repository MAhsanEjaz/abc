import 'package:abc_cash_and_carry/helper_services/custom_loader.dart';
import 'package:abc_cash_and_carry/providers/search_item_provider.dart';
import 'package:abc_cash_and_carry/screens/search_wrap_screen.dart';
import 'package:abc_cash_and_carry/services/search_item_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  String? text;

  SearchScreen({this.text});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchControl = TextEditingController();

  searchHandler() async {
    CustomLoader.showLoader(context: context);
    await SearchItemService()
        .itemSearch(context: context, keyWord: searchControl.text);
    CustomLoader.hideeLoader(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchItemProvider>(builder: (context, data, _) {
      return Scaffold(
        appBar: AppBar(
            toolbarHeight: 80,
            centerTitle: true,
            title: Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 8),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black54)),
                  child: TextField(
                    controller: searchControl,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: InputBorder.none,
                        hintText:
                            searchControl.text.isEmpty || widget.text!.isEmpty
                                ? widget.text
                                : 'Search'),
                    onSubmitted: (value) {
                      searchControl.text.length < 1
                          ? Container()
                          : searchHandler();
                    },
                  ),
                ))),
        body: SafeArea(
            child: data.searchItem == null || data.searchItem!.isEmpty
                ? Center(child: Text('Item Not Found'))
                : SingleChildScrollView(child: SearchWrapScreen())),
      );
    });
  }
}

class SearchText extends StatelessWidget {
  String? text;
  FontWeight? fontWeight;

  SearchText({this.text, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.clip),
    );
  }
}

class SearchScreen1 extends StatefulWidget {
  String? text;

  SearchScreen1({this.text});

  @override
  _SearchScreen1State createState() => _SearchScreen1State();
}

class _SearchScreen1State extends State<SearchScreen1> {
  TextEditingController searchControl = TextEditingController();

  searchHandler() async {
    CustomLoader.showLoader(context: context);
    await SearchItemService()
        .itemSearch(context: context, keyWord: searchControl.text);
    CustomLoader.hideLoader(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchItemProvider>(builder: (context, data, _) {
      return Scaffold(
        appBar: AppBar(
            toolbarHeight: 80,
            centerTitle: true,
            title: Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 8),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black54)),
                  child: TextField(
                    controller: searchControl,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: InputBorder.none,
                        hintText:
                            widget.text == null ? 'Search Items' : widget.text),
                    onSubmitted: (value) {
                      setState(() {});
                      searchHandler();
                    },
                  ),
                ))),
        body: SafeArea(
            child: data.searchItem!.isEmpty
                ? Center(child: Text('Item Not Found'))
                : SingleChildScrollView(child: SearchWrap1Screen())),
      );
    });
  }
}
