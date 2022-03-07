class UIHelpers{

  String formatPrice(double price){
    return "R\$$price";
  }

  bool checkEmptyDField(String data){

    if (data.isNotEmpty) return true;
    else return false;
  }

  bool validateFields(String title,String price,String type){

    if (title.isNotEmpty && price.isNotEmpty && type.isNotEmpty)
      return true;
    else
      return false;

  }

}