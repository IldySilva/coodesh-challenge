import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UIresponses{


  void sucessMessage(msg){
    Get.rawSnackbar(message: msg,backgroundColor: Colors.green);

  }
  void failMessage(msg){
    Get.rawSnackbar(message: msg,backgroundColor: Colors.red);

  }
  void internetFailMessage(msg){
    Get.rawSnackbar(message: "Falha,Verifique a sua conexão",backgroundColor: Colors.red);

  }
}