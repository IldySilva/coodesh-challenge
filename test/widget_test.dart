
import 'package:coodesh_challenge/model/products_model.dart';
import 'package:coodesh_challenge/view/widgets/customProductCard.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_test/flutter_test.dart';


void main() {

  testWidgets("Unit Test para revisar se está listando produtos", (WidgetTester tester) async {

    final testableWidget =Column(children: [
    CustomProductCard(product: Product(title: "T",description: "D",price: 2,width: 2,height: 2,type: "Frui",rating: 2),)

    ],);
    await tester.pumpWidget(testableWidget);
    expect(find.textContaining("T"),findsWidgets);
  });



}
