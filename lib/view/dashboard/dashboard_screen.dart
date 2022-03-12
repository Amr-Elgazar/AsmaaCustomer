import 'package:asmaaadminstaff/widgets/custom_text.dart';
import 'package:asmaaadminstaff/widgets/custom_text_form_field.dart';
import 'package:asmaaadminstaff/widgets/primary_color.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
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
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomTextFormField(
                    text: 'بحث',
                  icon: Icon(Icons.search),
                ),
              ),
              Items(),
              Items(),
              Items(), Items(), Items(), Items(), Items(), Items(), Items(), Items(), Items(), Items(), Items(), Items(), Items(),
            ],
          ),
        ),
      ),
    );
  }
}
class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

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
                  CustomText(text: 'حله توب شيف جرانيت',fontWeight: FontWeight.bold,fontSize: 15,),
                  Row(
                    children: [
                      CustomText(text: '100',color: Colors.grey,),
                      SizedBox(width: 10,),
                      CustomText(text: '110',color: Colors.grey,),
                      SizedBox(width: 10,),
                      CustomText(text: '120',color: Colors.grey,),
                    ],
                  ),
                  CustomText(text: 'رقم السلعه :1001',color: Colors.grey,),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

