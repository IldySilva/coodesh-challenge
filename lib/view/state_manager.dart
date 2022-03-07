import 'package:coodesh_challenge/view/modals_dialogs/responses.dart';
import 'package:get/get.dart';

import '../model/products_model.dart';

class ViewController extends GetxController{

  RxBool laodingMainButton=false.obs;
  RxBool fetchIsLoading=false.obs;
  List<Product> listOfProducts = [];
  UIresponses uIresponses =UIresponses();


}

ViewController viewController=Get.put(ViewController());