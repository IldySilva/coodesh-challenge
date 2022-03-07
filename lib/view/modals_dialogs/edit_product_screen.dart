import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../model/products_model.dart';
import '../../repository/products/products.dart';
import '../../utils/Ui_helpers.dart';
import '../state_manager.dart';

editProductDialog(context, Product product) {
  TextEditingController titleController =
      TextEditingController(text: product.title);
  TextEditingController descriptionController =
      TextEditingController(text: product.description);
  TextEditingController priceController =
      TextEditingController(text: product.price.toString());
  TextEditingController typeController =
      TextEditingController(text: product.type);
  TextEditingController heightController =
      TextEditingController(text: product.height.toString());
  TextEditingController widthtController =
      TextEditingController(text: product.width.toString());
  TextEditingController ratingController =
      TextEditingController(text: product.rating.toString());

  return showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.zero,
          title: Text(product.title ?? "Indefinido"),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * .1),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) => Get.appUpdate(),
                    controller: titleController,
                    decoration: InputDecoration(
                        errorText:
                            UIHelpers().checkEmptyDField(titleController.text)
                                ? null
                                : "*",
                        labelText: "Title",
                        hintText: product.title),
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                        labelText: "Description",
                        hintText: product.description!),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: Get.width * 0.2,
                        child: TextField(
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: heightController,
                          decoration: const InputDecoration(
                            labelText: "Heigth",
                          ),
                        ),
                      ),
                      Container(
                        width: Get.width * 0.2,
                        child: TextField(
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: widthtController,
                          decoration: InputDecoration(
                            labelText: "Width",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: Get.width * 0.2,
                        child: TextField(
                          onChanged: (value) => Get.appUpdate(),
                          controller: typeController,
                          decoration: InputDecoration(
                            errorText: UIHelpers()
                                    .checkEmptyDField(typeController.text)
                                ? null
                                : "*",
                            labelText: "type",
                          ),
                        ),
                      ),
                      Container(
                        width: Get.width * 0.2,
                        child: TextField(
                          maxLength: 1,
                          inputFormatters: [  FilteringTextInputFormatter.allow(RegExp('[1-5]')),],
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: ratingController,
                          decoration: InputDecoration(
                            labelText: "Rating",
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    onChanged: (value)=>
                      Get.appUpdate(),
                    keyboardType: TextInputType.numberWithOptions(),
                    controller: priceController,
                    decoration: InputDecoration(
                      errorText:
                          UIHelpers().checkEmptyDField(priceController.text)
                              ? null
                              : "*",
                      labelText: "Price*",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
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
              child: Obx(() => viewController.laodingMainButton.value
                  ? Center(
                      child: CircularProgressIndicator(
                      color: Colors.black,
                    ))
                  : Container(
                      width: Get.width * 0.8,
                      decoration: BoxDecoration(color: Colors.black),
                      child: TextButton(
                          onPressed: () async {
                            product.title=titleController.text;
                            product.description=descriptionController.text;
                            product.type=typeController.text;
                            product.price=double.parse(priceController.text);
                            product.height=int.parse(heightController.text);
                            product.width=int.parse(widthtController.text);
                            product.rating=int.parse(ratingController.text);
                            await IFirebaseServices().editProducts(product);
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Salvar",
                            style: TextStyle(color: Colors.white),
                          )))),
            )
          ],
        );
      });
}
