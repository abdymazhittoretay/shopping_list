import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final String itemName;
  final double itemPrice;

  const ItemTile({super.key, required this.itemName, required this.itemPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.image_outlined,
            size: 100,
          ),
          Text(
            itemName,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.0,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12.0)),
                child: Text(
                  "\$$itemPrice",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }
}
