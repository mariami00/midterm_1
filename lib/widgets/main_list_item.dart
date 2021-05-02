import 'package:flutter/material.dart';

class MainListItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  const MainListItem({
    this.imageUrl, this.name, this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            Container(
              child: FadeInImage(
                width: double.infinity,
                height: 130,
                fit: BoxFit.cover,
                placeholder: AssetImage("assets/images/123.png"),
                image: NetworkImage(imageUrl),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Text(name, style: TextStyle(
                        fontSize: 15
                    ),),
                    Text(price, style: TextStyle(
                        fontSize: 13
                    ),),
                  ],
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}

