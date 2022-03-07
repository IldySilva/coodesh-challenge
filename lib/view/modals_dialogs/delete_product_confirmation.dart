
import 'package:coodesh_challenge/data/firebase/firebase_services.dart';
import 'package:coodesh_challenge/repository/products/products.dart';
import 'package:coodesh_challenge/view/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/products_model.dart';


delectProductDialog(context, Product product) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.zero,
          title: Text("Deseja Mesmo Excluir  \"${product.title}\" da Lista?"),
          children: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "cancelar",
                  style: TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: Get.height * 0.01,
            ),
            ClipRRect(
              child:  Obx(()=>viewController.laodingMainButton.value?Center(child:CircularProgressIndicator(color: Colors.red,)): Container(
                  width: Get.width * 0.8,
                  decoration: BoxDecoration(color: Colors.red),
                  child: TextButton(
                      onPressed: () async {
                        await IFirebaseServices().deleteProduct(product);
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Confirmar",
                        style: TextStyle(color: Colors.white),
                      )))),
            )
          ],
        );
      });
}

