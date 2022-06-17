import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:notes/modules/simple/models/simple_model.dart';

class SimpleController extends GetxController {
  late final int id;

  final items = <SimpleModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments as int;
  }

  @override
  void onReady() async {
    super.onReady();
    await _loadItems();
  }

  Future<void> _loadItems() async {
    final data = await rootBundle.loadString('assets/json/simple.json');
    final result = json.decode(data) as List<dynamic>;
    final list = result.map((e) => SimpleData.fromJson(e)).toList();
    items.value = list.firstWhere((e) => e.id == id).simples ?? [];
  }

  void openSimplePage(SimpleModel item) {
    //  switch (widget.simple) {
    //   case 'utils':
    //     switch (model.id) {
    //       case 0:
    //         HUD.loading();
    //         await Future.delayed(const Duration(seconds: 5));
    //         HUD.dismiss();
    //         break;
    //       case 1:
    //         HUD.toast(msg: '加载成功');
    //         break;
    //       case 2:
    //         HUD.loading();
    //         break;
    //       case 3:
    //         HUD.loading();
    //         break;
    //       case 4:
    //         Input.show(
    //           context: context,
    //           hintText: '请输入',
    //         );
    //         break;
    //       case 5:
    //         Log.i('verbose1');
    //         Log.d('verbose1');
    //         Log.w('verbose1');
    //         Log.e('error1');
    //         Log.e('error2');
    //         Log.e('error3');
    //         break;
    //     }
    // }
  }
}