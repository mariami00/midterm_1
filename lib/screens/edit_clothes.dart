import 'package:flutter/material.dart';
import 'package:flutter_midterm1/data/helper_method/helper.dart';
import 'package:flutter_midterm1/data/models/clothes_models.dart';

class EditClothes extends StatefulWidget {
  static const routeName = "/edit-clothes";

  @override
  _EditClothesState createState() => _EditClothesState();
}

class _EditClothesState extends State<EditClothes> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController clothesID;
  TextEditingController clothesName;
  TextEditingController clothesUrl;
  TextEditingController clothesSize;
  TextEditingController clothesPrice;
  TextEditingController clothesDescription;

  @override
  Widget build(BuildContext context) {
    final Map parsedData = ModalRoute.of(context).settings.arguments as Map;
    final Clothes clothes = parsedData["clothes"];
    final int index = parsedData["index"];
    clothesID = TextEditingController(text: clothes.id.toString());
    clothesName = TextEditingController(text: clothes.name);
    clothesUrl = TextEditingController(text: clothes.imageUrl);
    clothesSize = TextEditingController(text: clothes.size.toString());
    clothesPrice = TextEditingController(text: clothes.price.toString());
    clothesDescription = TextEditingController(text: clothes.description);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("Details"),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
            ),
          )
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Card(
                  child: TextFormField(
                    controller: clothesID,
                    decoration: InputDecoration(hintText: "Please enter id"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid id";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: clothesName,
                    decoration: InputDecoration(hintText: "Please enter name"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid id";
                      }
                      return null;
                    },
                  ),
                ),Card(
                  child: TextFormField(
                    controller: clothesUrl,
                    decoration: InputDecoration(hintText: "Please enter url"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid url";
                      }
                      return null;
                    },
                  ),
                ),Card(
                  child: TextFormField(
                    controller: clothesSize,
                    decoration: InputDecoration(hintText: "Please enter size"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter size";
                      }
                      return null;
                    },
                  ),
                ),Card(
                  child: TextFormField(
                    controller: clothesPrice,
                    decoration: InputDecoration(hintText: "Please enter price"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter price";
                      }
                      return null;
                    },
                  ),
                ),Card(
                  child: TextFormField(
                    controller: clothesDescription,
                    decoration: InputDecoration(hintText: "Please enter description"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter description";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Back"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Clothes clothes = Clothes(
                            id: int.parse(clothesID.text),
                            name: clothesName.text,
                            imageUrl: clothesUrl.text,
                            price: double.parse(clothesPrice.text),
                            description: clothesDescription.text,
                          );
                          ClothesHelper().editClothes(clothes, index);
                          Navigator.pop(context);
                        }
                      },
                      child: Text("Edit"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
