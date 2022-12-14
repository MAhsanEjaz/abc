import 'package:abc_cash_and_carry/helper_services/add_to_cart_service.dart';
import 'package:abc_cash_and_carry/helper_services/custom_loader.dart';
import 'package:abc_cash_and_carry/helper_services/custom_snackbar.dart';
import 'package:abc_cash_and_carry/helper_services/navigation_services.dart';
import 'package:abc_cash_and_carry/helper_widgets/custom_textfield.dart';
import 'package:abc_cash_and_carry/providers/cart_invoice_number_provider.dart';
import 'package:abc_cash_and_carry/providers/cart_items_provider.dart';
import 'package:abc_cash_and_carry/providers/customer_profile_provider.dart';
import 'package:abc_cash_and_carry/providers/user_data_provider.dart';
import 'package:abc_cash_and_carry/screens/cart_screen.dart';
import 'package:abc_cash_and_carry/screens/search_screen.dart';
import 'package:abc_cash_and_carry/services/barcode_service.dart';
import 'package:abc_cash_and_carry/services/cart_services.dart';
import 'package:abc_cash_and_carry/services/customer_profile_service.dart';
import 'package:abc_cash_and_carry/services/inventory_item_service.dart';
import 'package:abc_cash_and_carry/services/search_item_service.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/inventory_item_get_model.dart';
import 'categories_listview_horizontal.dart';
import 'inventory_item_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchControl = TextEditingController();
  final _cancelController = TextEditingController(text: 'Cancel');

  searchHandler(String keyword) async {
    CustomLoader.showLoader(context: context);
    bool res = await SearchItemService()
        .itemSearch(context: context, keyWord: keyword);
    CustomLoader.hideeLoader(context);
    if (res) {
      NavigationServices.goNextAndKeepHistory(
          context: context,
          widget: SearchScreen(
            text: searchText,
          ));
    }
  }

  List<String> images = [
    'https://img.freepik.com/free-vector/sale-banner-template-design_74379-121.jpg',
    'https://i.pinimg.com/originals/26/57/04/26570426ec2cff73cae8635fad72e8c0.jpg',
    'https://img.freepik.com/free-vector/mega-sale-offers-banner-template_1017-31299.jpg?w=2000'
  ];

  getBarcodeHandler(String? barCode) async {
    ProductModel? res = await BarcodeService()
        .barcodeService(context: context, itemBarCode: barCode);

    if (res != null) {
      AddToCartService.addItemToCart(
        product: res,
        context: context,
        quantity: 1,
      );
    } else {
      CustomSnackBar.failedSnackBar(
          context: context, message: 'Item Not Found');
    }
  }

  int activeIndex = 0;

  int? userId;

  String? ticketId;

  _cartItemHandler() {
    userId =
        Provider.of<UserDataProvider>(context, listen: false).user!.data!.id!;
    CartServices().getCartItems(context: context, id: userId!);
  }

  String? searchText;

  int skipCount = 0;
  int getCount = 10;

  inventoryHandler({bool isLoadmore = false}) async {
    CustomLoader.showLoader(context: context);

    bool resInventory = await InventoryItemService().inventoryItemService(
        context: context, skipCount: skipCount, getCount: getCount);

    CustomLoader.hideeLoader(context);

    print("resInventory---->$resInventory");
  }

  int? id;

  getCustomerDataHandler() async {
    id = Provider.of<UserDataProvider>(context, listen: false).user!.data!.id;

    bool res = await CustomerProfileService()
        .customProfileService(context: context, id: id);

    print('response------> $res');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getCustomerDataHandler();
      _cartItemHandler();
      inventoryHandler();
    });
  }

  // ScanResult? _scanBarcode;

  Future<void> scanQR() async {
    var result = await BarcodeScanner.scan(
        options: ScanOptions(android: AndroidOptions(useAutoFocus: true)));

    print(result.type); // The result type (barcode, cancelled, failed)
    print(result.rawContent); // The barcode content
    print(result.format); // The barcode format (as enum)
    print(result
        .formatNote); // If a unknown format was scanned this field contains a note

    print('scanBar---->${result.rawContent}');
    await getBarcodeHandler(result.rawContent);

    // String barcodeScanRes;
    // try {
    //   _scanBarcode = await FlutterBarcodeScanner.scanBarcode(
    //       '#ff6666', 'Cancel', true, ScanMode.BARCODE);
    //
    //   print(_scanBarcode);
    // } on PlatformException {
    //   _scanBarcode = 'Failed to get platform version.';
    // }
    // if (!mounted) return;
    // setState(() async {
    //   // _scanBarcode = barcodeScanRes;
    //   await getBarcodeHandler(_scanBarcode);
    // });
  }

  Future<bool> popDialog() async {
    return await showCupertinoModalPopup(
        context: context,
        builder: (context) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Do you want to close your application?',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      Divider(),
                      Row(children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('No')),
                        Spacer(),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: Text('Yes')),
                      ])
                    ])))));
  }

  Future<void> refresh() async {
    await inventoryHandler();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: WillPopScope(
          onWillPop: popDialog,
          child: Consumer3<CartItemsProvider, CartInvoiceNumberProvider,
                  CustomerProfileProvider>(
              builder: (context, data, cartInvoice, profile, _) {
            return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    title: profile.customerProfileData == null
                        ? CupertinoActivityIndicator(radius: 10)
                        : Text(
                            'Welcome ${profile.customerProfileData!.fullName.toString()}',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                    leading: Builder(
                        builder: (context) => IconButton(
                              onPressed: () {
                                ZoomDrawer.of(context)!.toggle();
                              },
                              icon: Icon(Icons.sort_outlined),
                            )),
                    actions: [
                      IconButton(
                        onPressed: () => scanQR(),
                        icon: Icon(
                          Icons.qr_code_outlined,
                          color: Colors.black,
                        ),
                      ),
                      Consumer<CartItemsProvider>(builder: (context, data, _) {
                        return Stack(children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return CartScreen();
                                }));
                              },
                              icon: Icon(
                                Icons.shopping_cart,
                                color: Colors.green,
                              )),
                          Text(
                            data.cartItems!.length.toString(),
                            style: TextStyle(color: Colors.red),
                          )
                        ]);
                      })
                    ]),
                body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RefreshIndicator(
                      onRefresh: refresh,
                      triggerMode: RefreshIndicatorTriggerMode.anywhere,
                      child: LazyLoadScrollView(
                        onEndOfPage: () {
                          print('im at end');
                          loadMore();
                        },
                        child: SingleChildScrollView(
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            CustomTextField(
                              prefix: InkWell(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                  },
                                  child: Icon(Icons.close)),
                              onSubmit: (value) {
                                searchControl.text.length < 1
                                    ? Container()
                                    : searchHandler(value);
                                searchControl.clear();
                                searchText = value;
                              },
                              hintText: 'Search',
                              controller: searchControl,
                              textInputAction: TextInputAction.search,
                              prefixIcon: Icons.search_sharp,
                            ),
                            SizedBox(height: 20),
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CarouselSlider(
                                        items: images
                                            .map((e) => e.isEmpty
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator())
                                                : Container(
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image:
                                                                NetworkImage(e),
                                                            fit: BoxFit.cover)),
                                                  ))
                                            .toList(),
                                        options: CarouselOptions(
                                            viewportFraction: 1,
                                            autoPlay: true,
                                            onPageChanged: (index, r) {
                                              setState(() {
                                                activeIndex = index;
                                              });
                                            })),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 20),
                                  child: AnimatedSmoothIndicator(
                                      onDotClicked: (value) {
                                        activeIndex = value;
                                        setState(() {});
                                      },
                                      effect: ExpandingDotsEffect(
                                          dotWidth: 7,
                                          dotHeight: 6,
                                          activeDotColor: Colors.orange),
                                      activeIndex: activeIndex,
                                      count: images.length),
                                )
                              ],
                            ),
                            CategoriesListViewHorizontal(),
                            InventoryItemScreen(),
                          ]),
                        ),
                      ),
                    )));
          })),
    );
  }

  loadMore() async {
    // skipCount = getCount;
    getCount = getCount + 30;
    await inventoryHandler(isLoadmore: true);
  }
}
