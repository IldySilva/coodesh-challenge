import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/Ui_helpers.dart';
import '../modals_dialogs/delete_product_confirmation.dart';
import '../modals_dialogs/edit_product_screen.dart';
import '../modals_dialogs/productDetails.dart';

class CustomProductCard extends StatelessWidget {
  CustomProductCard({this.product});

  var product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                offset: Offset(-6.0, -6.0),
                blurRadius: 16.0,
                color: Color(0xfa8a8a8)),
            BoxShadow(
                offset: Offset(6.0, 6.0),
                blurRadius: 16.0,
                color: Color(0xfa8a8a8)),
          ],
        ),
        height: Get.height * 0.24,
        child: Row(
          children: [
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
            Container(
              margin: EdgeInsets.only(
                  left: Get.width * 0.035, top: Get.width * 0.035),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: Get.width * .36,
                        child: Text(
                          product.title!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      PopupMenuButton<String>(
                        onSelected: (choice) => _onPopUpMenuButtonSelected(
                            context: context, option: choice, product: product),
                        itemBuilder: (BuildContext context) {
                          return {
                            'Detalhes',
                            'Editar',
                            'Excluir',
                          }.map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      ),
                    ],
                  ),
                  Container(
                    width: Get.width * .45,
                    constraints: BoxConstraints(
                      maxHeight: Get.width * .15,
                    ),
                    child: Text(
                      product.description !,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                  ),
                  Container(
                    width: Get.width * .45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            for (var stars = 0;
                                stars != product.rating!;
                                stars++)
                              const Icon(
                                Icons.star,
                                color: Colors.yellowAccent,
                                size: 16,
                              )
                          ],
                        ),
                        Chip(
                            backgroundColor: Colors.grey[100],
                            label:
                                Text(UIHelpers().formatPrice(product.price!)))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_onPopUpMenuButtonSelected({context, option, product}) {
  if (option == "Editar") editProductDialog(context, product);
  if (option == "Detalhes") productDetailsDialog(context, product);
  if (option == "Excluir") delectProductDialog(context, product);
}
