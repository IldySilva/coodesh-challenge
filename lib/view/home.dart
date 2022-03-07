import 'package:coodesh_challenge/repository/products/products.dart';
import 'package:coodesh_challenge/view/widgets/customProductCard.dart';
import 'package:coodesh_challenge/view/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    IFirebaseServices().fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _buildAppBar(),
      body: Obx(()=> viewController.fetchIsLoading.value?Center(child: CircularProgressIndicator(color: Colors.black,),):

      viewController.listOfProducts.isEmpty?Center(child: Text("Sem Produtos"),):
      ListView(
        children: [
          for (var  product in viewController.listOfProducts)
            CustomProductCard(product:product)
        ],
      ),
    )));
  }


  _buildAppBar() {
    return AppBar(
      title: const Text("Products", style: TextStyle(color: Colors.black)),
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () =>    IFirebaseServices().fetchProducts(),
          icon: const Icon(Icons.refresh),
        )
      ],
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}
