import 'package:flutter/material.dart';
import 'package:flutter_midterm1/data/models/dummy_data.dart';
import 'package:flutter_midterm1/data/models/clothes_models.dart';
import 'package:flutter_midterm1/screens/add_new_clothes.dart';
import 'package:flutter_midterm1/screens/edit_clothes.dart';
import 'package:flutter_midterm1/widgets/main_list_item.dart';
import 'clothes_details.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Clothes> clothesList = DUMMY_DATA;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Clothes App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 30,
          ),
          itemCount: clothesList.length,
          itemBuilder: (BuildContext ctx, index) {
            var clothes = clothesList[index];
            return GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                ClothesDetailsScreen.routeName,
                arguments: clothes,
              ),
              onLongPress: () {
                Navigator.pushNamed(context, EditClothes.routeName, arguments: {"clothes": clothes, "index": index},
                ).then((_) {
                  setState(() {

                  });
                });
              },
              child: MainListItem(
                imageUrl: clothes.imageUrl,
                name: clothes.name,
                price: clothes.price.toString(),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, AddNewClothes.routeName).then((_) {
              setState(() {});
            }),
        child: Icon(Icons.add),
      ),
    );
  }
}
