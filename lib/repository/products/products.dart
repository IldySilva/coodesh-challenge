

import 'package:coodesh_challenge/data/firebase/firebase_services.dart';
import 'package:coodesh_challenge/model/products_model.dart';
import 'package:coodesh_challenge/utils/Ui_helpers.dart';
import 'package:coodesh_challenge/view/state_manager.dart';

class IFirebaseServices{

  dynamic fetchProducts()=> FirebaseServices().fetchProducts();


  dynamic deleteProduct(Product product) async {
    if(UIHelpers().checkEmptyDField(product.id))
      return  await FirebaseServices().deleteProduct(product.id);
  }


  dynamic editProducts(Product product) async {

    if(UIHelpers().validateFields(product.title!, product.price.toString(), product.type!)) await FirebaseServices().editProduct(product);
    else
  viewController.uIresponses.failMessage("Preencha Todos os Campos Obrigatórios");
  }

}