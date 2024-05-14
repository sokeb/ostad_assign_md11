import 'package:flutter/material.dart';
import 'widgets/card_design.dart';
import 'datasource/products_data.dart';

class MyBagScreen extends StatefulWidget {
  const MyBagScreen({super.key});

  @override
  State<MyBagScreen> createState() => _MyBagScreenState();
}

class _MyBagScreenState extends State<MyBagScreen> {
  List<Map?>? productData = ProductData.products;
  var amount = 0;

  mySnackBar(massage, context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(massage),
    ));
  }

  @override
  Widget build(BuildContext context) =>
      OrientationBuilder(builder: (context, orientation) {
        final isPortrait = orientation == Orientation.portrait;
        return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff626060).withOpacity(0.06),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search))
              ],
            ),
            body: Container(
              color: const Color(0xff626060).withOpacity(0.06),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: isPortrait ? 1 : 2,
                      child: const Text(
                        'My Bag',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: isPortrait ? 13 : 9,
                        child: ListView.builder(
                            itemCount: productData!.length,
                            itemBuilder: (context, index) => CardDesign(
                                  imageUrl: "${productData![index]!["image"]}",
                                  price: productData![index]!["price"],
                                  color: "${productData![index]!["color"]}",
                                  size: "${productData![index]!["size"]}",
                                  name: "${productData![index]!["name"]}",
                                  onChanged: (int value) {
                                    amount += value;
                                    setState(() {});
                                  },
                                ))),
                    Expanded(
                        flex: isPortrait ? 2 : 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Total amount: ",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                Text(
                                  "$amount\$",
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                mySnackBar("congratulation", context);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffDB3022),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 140, vertical: 10)),
                              child: const Text('CHECK OUT'),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ));
      });
}
