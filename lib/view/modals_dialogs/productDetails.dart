import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../model/products_model.dart';
import '../../utils/Ui_helpers.dart';


productDetailsDialog(context, Product product) {
  TextEditingController titleController =
  TextEditingController(text: product.title);
  TextEditingController descriptionController =
  TextEditingController(text: product.description);
  TextEditingController priceController =
  TextEditingController(text: UIHelpers().formatPrice(product.price!));
  TextEditingController typeController =
  TextEditingController(text: product.type);
  TextEditingController heightController =
  TextEditingController(text: product.height.toString());
  TextEditingController widthtController =
  TextEditingController(text: product.width.toString());
  TextEditingController ratingController =
  TextEditingController(text: product.rating.toString());
  TextEditingController uploadDateController =
  TextEditingController(text: DateFormat("dd-MM-yyyy").format(product.upload_date!));

  return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.zero,

          title: Text(product.title ?? "Indefinido"),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * .1),
              child: Column(
                children: [
                  SizedBox(height: 8,),
                  Container(
                    margin: EdgeInsets.only(left: Get.width * 0.035),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    width: Get.width * .32,
                    height: Get.width * .32,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: product.photo_url??"",
                        placeholder: (a,b)=>Center(child: CircularProgressIndicator(color: Colors.black,)),
                        errorWidget: (a,b,c){
                          return Icon(Icons.photo,color: Colors.white,);


                        },),
                    ),
                  ),


                  TextField(
                    readOnly: true,
                    controller: titleController,
                    decoration: InputDecoration(
                        labelText: "Title", hintText: product.title),
                  ),
                  TextField(
                    readOnly: true,

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
                          readOnly: true,

                          controller: heightController,
                          decoration: const InputDecoration(
                            labelText: "Heigth",
                          ),
                        ),
                      ),
                      Container(
                        width: Get.width * 0.2,
                        child: TextField(
                          readOnly: true,

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
                          readOnly: true,

                          controller: typeController,
                          decoration: InputDecoration(
                            labelText: "type",
                          ),
                        ),
                      ),
                      Container(
                        width: Get.width * 0.2,
                        child: TextField(
                          readOnly: true,

                          controller: ratingController,
                          decoration: InputDecoration(
                            labelText: "Rating",
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
                     readOnly: true,

                     controller: priceController,
                     decoration: InputDecoration(
                       labelText: "Price",
                     ),
                   ),
                 ),
                 Container(
                   width: Get.width * 0.2,

                   child: TextField(
                     readOnly: true,

                     controller: uploadDateController,
                     decoration: InputDecoration(
                       labelText: "Upload Date",
                     ),
                   ),
                 ),

               ],)
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),


            ClipRRect(
              child: Container(
                  width: Get.width * 0.8,
                  decoration: BoxDecoration(color: Colors.black),
                  child: TextButton(
                      onPressed: () =>Navigator.pop(context),
                      child: Text(
                        "OK",
                        style: TextStyle(color: Colors.white),
                      ))),
            )
          ],
        );
      });
}
