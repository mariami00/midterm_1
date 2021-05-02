import 'package:flutter/material.dart';
import 'package:flutter_midterm1/data/helper_method/helper.dart';
import 'package:flutter_midterm1/data/models/clothes_models.dart';

class ClothesDetailsScreen extends StatefulWidget {
  static const routeName = "/clothes-details";

  @override
  _ClothesDetailsScreenState createState() => _ClothesDetailsScreenState();
}

class _ClothesDetailsScreenState extends State<ClothesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final Clothes clothes = ModalRoute.of(context).settings.arguments as Clothes;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Details"),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  ClothesHelper().removeClothes(clothes.id);
                  Navigator.pop(context);
                });
              },
              child: Icon(
                Icons.delete,
              ),
            ),
          )
        ],
      ),
          body: Padding(
            padding: EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Card(
                    child: Container(
                        height: 350,
                        width: double.infinity,
                        child: FittedBox(
                          child: Image.network(clothes.imageUrl),
                          fit: BoxFit.fill,
                        )
                    ),
                    elevation: 0.0,
                  ),
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Name:", style: TextStyle(
                          fontSize: 18
                        ),),
                        SizedBox(width: 185,),
                        Text(clothes.name, style: TextStyle(
                          fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                    elevation: 0.0,
                  ),
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Price:", style: TextStyle(
                            fontSize: 18
                        ),),
                        SizedBox(width: 192,),
                        Text(clothes.price.toString(), style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                    elevation: 0.0,
                  ),
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Size:", style: TextStyle(
                            fontSize: 20
                        ),),
                        Text(clothes.size, style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                    elevation: 0.0,
                  ),
                  SizedBox(height: 30),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(clothes.description, style: TextStyle(
                          fontSize: 20
                        ),),
                      ],
                    ),
                    elevation: 0.0,
                  )
                ]
              ),
          ),
    );
  }
}
