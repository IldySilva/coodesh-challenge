import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coodesh_challenge/model/products_model.dart';
import 'package:coodesh_challenge/view/state_manager.dart';
import 'package:flutter/cupertino.dart';

class FirebaseServices {
  var _firestoreCollection = FirebaseFirestore.instance.collection("products");

  dynamic fetchProducts() async {
    List<Product> products=[];
    try {
      viewController.fetchIsLoading.value=true;
     products = await _firestoreCollection.get().then((value) =>
          value.docs.map((e) => Product.fromJson(e.id, e.data())).toList());
      viewController.fetchIsLoading.value=false;

    } on Exception catch (ex) {
      viewController.uIresponses.failMessage(ex);
      viewController.fetchIsLoading.value=false;
      return [];
    }
    viewController.listOfProducts=products;

  }


  dynamic deleteProduct(var productId) async {
    try{
      viewController.laodingMainButton.value=true;
      await _firestoreCollection.doc(productId).delete();
      await fetchProducts();
      viewController.laodingMainButton.value=false;
    }on Exception catch(e){
      viewController.uIresponses.failMessage(e);
      viewController.laodingMainButton.value=false;

      return null;
    }
  }

  dynamic editProduct(Product product) async {
    try{
      viewController.laodingMainButton.value=true;
      await _firestoreCollection.doc(product.id).set(product.toJson());
      await fetchProducts();
      viewController.laodingMainButton.value=false;

    }on Exception catch(e){
      viewController.laodingMainButton.value=false;
      return null;

    }
  }




}
