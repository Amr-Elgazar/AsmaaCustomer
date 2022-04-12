import 'package:asmaaadminstaff/widgets/custom_text.dart';
import 'package:asmaaadminstaff/widgets/custom_text_form_field.dart';
import 'package:asmaaadminstaff/widgets/primary_color.dart';
import 'package:flutter/material.dart';

import '../../Api/api.dart';
import '../../Modules/products_model.dart';
import '../../core/size_config.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  bool loading = true;
  List<Products> products = [] , products2 = [];
  int possition = -1;
  String sectionName = 'جميع المنتجات';
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

      ServData.getProducts().then((value) {
        setState(() {
          products = value;
          products2 = value;
        });
      }).whenComplete((){ setState(() {
        loading = false;
      });});

  }

  void filterSearch(String query) {
    List<Products> dummyData = products2;
    if (query.isNotEmpty) {
      List<Products> resultSearchProduct = [];
      for (int x = 0; x < dummyData.length; x++) {
        if (dummyData[x]
            .productCode
            .replaceAll('"', '')
            .toLowerCase()
            .contains(query.toLowerCase())) {
          resultSearchProduct.add(dummyData[x]);
        }else if (dummyData[x]
            .name
            .replaceAll('"', '')
            .toLowerCase()
            .contains(query.toLowerCase())) {
          resultSearchProduct.add(dummyData[x]);
        }
      }
      setState(() {
        products = resultSearchProduct;
      });
      return;
    } else {
      setState(() {
        products = [];
        products = products2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
         appBar: AppBar(
           automaticallyImplyLeading: false,
           backgroundColor: Colors.white,
           title: Row(children: [
             CustomText(text: 'اسماء',
               color: primaryColor,
               fontWeight: FontWeight.bold,
               fontSize: 23,),
             CircleAvatar(
               backgroundColor: Colors.white,
               child: Image.asset('assets/logo.jpg'),
             )
           ]),

         ),
        body: SingleChildScrollView(
          child: Column(
            children:  [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: searchController,
                  onChanged: (value) {
                    filterSearch(value);
                  },
                  onFieldSubmitted: (v) {
                    filterSearch(v);
                  },
                  decoration: const InputDecoration(
                      labelText: 'إضافه رقم السلعه',
                      border: OutlineInputBorder()),
                ),
              ),
              Container(
                margin:
                EdgeInsets.only(top: SizeConfig.screenHeight! * 0.01),
                width: SizeConfig.screenWidth!,
                height: SizeConfig.screenHeight! * 0.5,
                child: ListView.builder(
                    itemCount: products.isEmpty ? 0 : products.length,
                    itemBuilder: (context, index) => Items(products: products[index],)),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class Items extends StatefulWidget {
  Products products;
   Items({Key? key , required this.products}) : super(key: key);

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10,left: 10,bottom: 10),
      child: Material(
        elevation: 10,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/logo.jpg', height: 150, width: 150),

              Column(
                children: [
                  CustomText(text: '${widget.products.name}' ,textOverflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold,fontSize: 15,),
                  Row(
                    children: [
                      CustomText(text: '${widget.products.sellingPrice}',color: Colors.grey,),
                      SizedBox(width: 10,),
                      CustomText(text: '${widget.products.wholesalePrice}',color: Colors.grey,),
                      SizedBox(width: 10,),
                      CustomText(text: '${widget.products.installmentPrice}',color: Colors.grey,),
                    ],
                  ),
                  CustomText(text: 'رقم السلعه : ${widget.products.productCode}',color: Colors.grey,),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

