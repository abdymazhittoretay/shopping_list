import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/models/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        surfaceTintColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Cart",
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
            Expanded(child: Consumer<CartModel>(
              builder: (context, value, child) {
                return value.cartItems.isNotEmpty
                    ? ListView.builder(
                        itemCount: value.cartItems.length,
                        itemBuilder: (context, index) {
                          var backIndex = value.cartItems.length - index - 1;
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(Icons.image_outlined),
                            title: Text(value.cartItems[backIndex][0]),
                            subtitle:
                                Text("\$${value.cartItems[backIndex][1]}"),
                            trailing: IconButton(
                                onPressed: () {
                                  Provider.of<CartModel>(context, listen: false)
                                      .deleteItem(backIndex);
                                },
                                icon: Icon(Icons.remove)),
                          );
                        },
                      )
                    : Center(
                        child: Text(
                          "There are no items yet.",
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                        ),
                      );
              },
            )),
            Container(
              padding: EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total price:",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      Text(
                        "\$${Provider.of<CartModel>(context).totalPrice()}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Provider.of<CartModel>(context, listen: false)
                          .cartItems
                          .isNotEmpty
                      ? Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Text(
                            "Pay now",
                            style: TextStyle(color: Colors.white),
                          ))
                      : SizedBox()
                ],
              ),
            ),
            SizedBox(
              height: 48.0,
            )
          ],
        ),
      ),
    );
  }
}
