import 'package:flutter_midterm1/data/models/dummy_data.dart';
import 'package:flutter_midterm1/data/models/clothes_models.dart';

class ClothesHelper {
  void addClothes(Clothes clothes) {
    DUMMY_DATA.add(clothes);
  }

  void removeClothes(int id) {
    DUMMY_DATA.removeWhere((element) => element.id == id);
  }

  void editClothes(Clothes clothes, int index) {
    DUMMY_DATA.replaceRange(index, index + 1, [clothes]);
  }
}