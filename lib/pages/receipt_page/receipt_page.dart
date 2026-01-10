import "package:flutter/material.dart";
import "package:bill_and_balance/components/custom_app_bar/custom_app_bar.dart";
import "package:bill_and_balance/components/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart";


class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  static Widget route() {
    return  Scaffold(
      backgroundColor: Color(0xfffff9f3),
      appBar: CustomAppBar(),
      body: ReceiptPage(),
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(backgroundColor:   Color(
          0xd0e5bc90) ,onPressed: (){},child: Icon(Icons.add),),
    );;
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListView(
        children: [
          CustomListItem(group: "group",title: "Whole Food",desc: "desc", dateTime:"date", totalPrice: "80",),
          CustomListItem(group: "group",title: "Whole Food",desc: "desc", dateTime:"date", totalPrice: "80",),
          CustomListItem(group: "group",title: "Whole Food",desc: "desc", dateTime:"date", totalPrice: "80",),
          CustomListItem(group: "group",title: "Whole Food",desc: "desc", dateTime:"date", totalPrice: "80",),


        ],
      ),
    );
  }
}

class CustomListItem extends StatelessWidget {
  final String title;
  final String group;
  final String totalPrice;
  final String desc;
  final String dateTime;
  const CustomListItem({super.key, required this.group, required this.title, required this.totalPrice, required this.desc, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10),
      elevation: 1,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,

          ),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Text(group, style: TextStyle(fontSize: 10),),
                  ),
                  SizedBox(height: 3,),


                  Text(title, style: TextStyle(fontSize: 18)),
                  SizedBox(height: 3,),

                  Text(desc,style: TextStyle(fontSize: 14)),
                  SizedBox(height: 6,),

                  Text(dateTime, style: TextStyle(fontSize: 11)),
                ],
              ),
              Text("\$$totalPrice", style: TextStyle(fontSize: 22), ),

            ],
          )
      ),
    );
  }
}
