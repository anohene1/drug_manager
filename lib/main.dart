import 'package:drugmanager/elements.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'size_config.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;

int quanity = 1;
Color primary = Color(0xFF39269C);
Color buttonColor = Color(0xFFA698F0);

TextEditingController drugID;
TextEditingController drugName;
TextEditingController expiryDate;
TextEditingController price;

void main(){
  runApp(DrugManage());
}

class DrugManage extends StatefulWidget {
  @override
  _DrugManageState createState() => _DrugManageState();
}

class _DrugManageState extends State<DrugManage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'gilroy'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Row(
            children: [
              //Nav Area
              BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                  width: 290, //MediaQuery.of(context).size.width,
                  color: primary,
                  child: Column(
                    children: [
                      SizedBox(height: 50,),
                     //Logo
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            height: 50,
                            width: 50,
                            child: Image.asset('images/druglogo.png'),
                          ),
                          SizedBox(width: 10,),
                          Text('Drew Pharmacy', style: TextStyle(fontFamily: 'gil', fontSize: 20, color: Colors.white),)
                        ],
                      ),
                      //NavList
                      SizedBox(height: 150,),
                      NavList(text: "Sales", icon: Icon(CupertinoIcons.tag_solid, color: Colors.white,), color: Color(0xFF2C1C89)),
                      SizedBox(height: 10,),
                      NavList(text: 'Stocks', icon: Icon(Icons.developer_board, color: Colors.white,)),
                      SizedBox(height: 10,),
                      NavList(text: 'Drug List', icon: Icon(Icons.list, color: Colors.white,)),
                      SizedBox(height: 10,),
                      NavList(text: 'Accounts', icon: Icon(Icons.attach_money, color: Colors.white,))
                    ],
                  ),
                ),
              ),
              //Form Area
              Container(
                width: 557,
                padding: EdgeInsets.all(50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Sales Statistics Button and Search bar
                    Row(
                      children: [
                        //Sales Statistics Button
                        Container(
                          height: 50,
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Icon(Icons.insert_chart, color: primary,),
                              SizedBox(width: 10,),
                              Text('Sales statistics', style: TextStyle(color: primary, fontWeight: FontWeight.bold),)
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  color: primary,
                                  width: 1
                              ),
                              borderRadius: BorderRadius.circular(8)
                          ),
                        ),
                        SizedBox(width: 10,),
                        //Search Bar
                        Container(
                          width: 300,
                          height: 66,
                          padding: EdgeInsets.all(8),
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 2),
                              hintText: 'Search',
                              prefixIcon: Icon(CupertinoIcons.search),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: primary)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: primary)
                              )
                            ),
                          ),

                        )
                      ],
                    ),
                    SizedBox(height: 70,),
                    Text('Use barcode scanner', style: TextStyle(fontFamily: 'gil', fontSize: 20, color: primary, letterSpacing: 0.5),textAlign: TextAlign.left,),
                    SizedBox(height: 20,),
                    //TextFields
                    FormItem(title: 'Drug ID', controller: drugID),
                    SizedBox(height: 20,),
                    FormItem(title: 'Drug Name', controller: drugName),
                    SizedBox(height: 20,),
                    FormItem(title: 'Expiry Date', controller: expiryDate),
                    SizedBox(height: 20,),
                    FormItem(title: 'Price', controller: price),
                    SizedBox(height: 20,),
                    Text('Quantity'),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(7),
                          width: 147,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Colors.grey,
                                  width: 1
                              ),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    if (quanity != 0){
                                      quanity--;
                                    }
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Icon(Icons.remove, size: 15,),
                                ),
                              ),
                              Text( quanity == 1 ? '$quanity pc' : '$quanity pcs'),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    quanity++;
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Icon(Icons.add, size: 15,),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          width: 300,
                          height: 66,
                          padding: EdgeInsets.all(8),
                          child: TextField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: 2, left: 10),
                                hintText: 'Retials quantity',
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.red)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.grey)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: primary)
                                )
                            ),
                          ),

                        )
                      ],
                    ),
                    SizedBox(height: 70,),
                    GestureDetector(
                      child: Container(
                        width: 500,
                        height: 56,
                        decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Center(
                          child: Text('Add to invoice',style: TextStyle(color: Colors.white, fontFamily: 'gil'),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              //Divider Line
              Container(
                margin: EdgeInsets.only(top: 100),
                height: 620,
                width: 1,
                color: Colors.grey,
              ),
              //Invoice Bill Area
              Container(
                width: 700,
                margin: EdgeInsets.all(55),
                child: Column(
                  children: [
                    //User
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 50,
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Container(

                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.grey
                                ),
                                child: Image.asset('images/dp.png'),
                              ),
                              SizedBox(width: 10,),
                              Text('anoheneisaac@gmail.com', style: TextStyle(color: primary, fontWeight: FontWeight.bold),),
                              Icon(Icons.expand_more)
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  color: primary,
                                  width: 1
                              ),
                              borderRadius: BorderRadius.circular(8)
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50,),
                    //Invoice Bill
                    Container(
                      height: 45,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color(0xFFEAE8F3),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Center(
                        child: Text('Invoice bill', style: TextStyle(color: Color(0xFF5442AE), fontFamily: 'gil'),),
                      ),
                    ),
                    SizedBox(height: 28,),
                    // Textfields
                    Container(

                      child: Row(
                        children: [
                          Expanded(child: FormItem(title: 'Name')),
                          SizedBox(width: 20,),
                          Expanded(child: FormItem(title: 'Phone Number'),)
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 40,
                            child: Text('SL', style: TextStyle(fontFamily: 'gil'),),
                          ),
                          Container(
                            width: 160,
                            child: Text('Drug Name', style: TextStyle(fontFamily: 'gil'),),
                          ),
                          Container(
                            width: 90,
                            child: Text('Quantity', style: TextStyle(fontFamily: 'gil'),),
                          ),
                          Container(
                            width: 90,
                            child: Text('Unit Price', style: TextStyle(fontFamily: 'gil'),),
                          ),
                          Container(
                            width: 90,
                            child: Text('Price', style: TextStyle(fontFamily: 'gil'),),
                          )
                        ],
                      ),
                    ),
                    Items(sl: '01', name: 'Ocumex', quantity: '2 pcs', unitPrice: '100.00', price: '200.00'),
                    Items(sl: '02', name: 'Seclo', quantity: '1 box', unitPrice: '257.00', price: '257.00'),
                    Items(sl: '03', name: 'Omep', quantity: '1 box', unitPrice: '358.00', price: '358.00'),
                    Items(sl: '04', name: 'Clamex 600', quantity: '1 box', unitPrice: '560.00', price: '560.00'),
                    Items(sl: '05', name: 'Monus 10', quantity: '1 box', unitPrice: '180.50', price: '180.00'),
                    SizedBox(height: 20,),
                    Container(height: 2,
                    decoration: BoxDecoration(
                      color: Colors.grey[200]
                    ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total price', style: TextStyle(fontFamily: 'gil'),),
                          Text('1555.50', style: TextStyle(fontFamily: 'gil'))
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text('In words:', style: TextStyle(fontFamily: 'gil')),
                          SizedBox(width: 10,),
                          Text('One thousand, five hundred and fifty five Cedis only.')
                        ],
                      ),
                    ),
                    SizedBox(height: 50,),
                   Row(
                     children: [
                       Container(
                         height: 50,
                         width: 250,
                         padding: EdgeInsets.all(8),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text('Cancel order', style: TextStyle(color: primary, fontFamily: 'gil'),),
                           ],
                         ),
                         decoration: BoxDecoration(
                             border: Border.all(
                                 style: BorderStyle.solid,
                                 color: primary,
                                 width: 1
                             ),
                             borderRadius: BorderRadius.circular(8)
                         ),
                       ),
                       SizedBox(width: 20,),
                       Expanded(child: GestureDetector(
                         child: Container(
                           height: 55,
                           decoration: BoxDecoration(
                               color: Color(0xFF5538E8),
                               borderRadius: BorderRadius.circular(8)
                           ),
                           child: Center(
                             child: Text('Confirm & print',style: TextStyle(color: Colors.white, fontFamily: 'gil'),),
                           ),
                         ),
                       ))
                     ],
                   )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
