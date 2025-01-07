import 'package:flutter/material.dart';
import 'package:shopping_list/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopify,
                size: 200,
              ),
              Text(
                "Welcome to ShopEase!",
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "Your Smart Shopping Companion",
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                height: 24.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12.0)),
                  child: Text("Get Started",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
