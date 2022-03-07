class UIHelpers {
  String formatPrice(double price) {
    return "R\$$price";
  }

  bool checkEmptyDField(String data) {
    if (data.isNotEmpty)
      return true;
    else
      return false;
  }

  bool validateFields(String title, String price, String type) {
    return title.isNotEmpty && price.isNotEmpty && type.isNotEmpty
        ? true
        : false;
  }
}
