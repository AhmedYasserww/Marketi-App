import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
static const String routeName='CartView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Cart"),
        centerTitle: true,
        leading: Container(
          height: 48,
          width: 48,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xffB2CCFF).withOpacity(0.7)),
          ),
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
        actions: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Color(0xff3F80FF),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: const Icon(Icons.person, color: Colors.black),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text('Products on Cart'),
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) {
                return listViewItem();
              },
            ),
          ),
          Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xffB2CCFF).withOpacity(0.7)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffB2CCFF).withOpacity(0.5),
                    blurRadius: 10,
                    offset: Offset(0, -1),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Suptotal (3 items)'),
                      const Spacer(),
                      Text('EGP 1,120,00'),
                    ],
                  ),
                  SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff3F80FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
  Widget listViewItem() {
    return Container(
      margin: const EdgeInsets.only(right: 14,left: 14,bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 14),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xffB2CCFF).withOpacity(0.7)),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffB2CCFF).withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, -1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Image.network(
            'https://storage.googleapis.com/cms-storage-bucket/a9d6ce81aee44ae017ee.png',
            width: 107,
            height: 108,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Pampers Swaddlers'),
                    Spacer(),
                    Icon(Icons.favorite),
                  ],
                ),
                Text('84 Diapers'),
                Row(
                  children: [
                    Text('Price: 345,00 EGP'),
                    Spacer(),
                    Icon(Icons.star_border_outlined),
                    Text('4.5'),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 41,
                      decoration: BoxDecoration(
                        color: Color(0xffD9E6FF),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.delete, color: Colors.red, size: 17.78),
                    ),
                    Spacer(),
                    Text('1'),
                    Spacer(),
                    Container(
                      width: 40,
                      height: 41,
                      decoration: BoxDecoration(
                        color: Color(0xffD9E6FF),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.add, color: Colors.red, size: 17.78),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
