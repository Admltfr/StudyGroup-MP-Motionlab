import 'package:flutter/material.dart';
import 'package:flutter_motion1/controller/cart_controller.dart';
import 'package:get/get.dart';

class CartCard extends StatelessWidget {
  final String linkAsset, titleText, subtitleText;

  const CartCard(
      {super.key,
      required this.linkAsset,
      required this.titleText,
      required this.subtitleText});

  @override
  Widget build(BuildContext context) {
    final String tag = UniqueKey().toString();
    final cartController = Get.put(CartController(), tag: tag);
    return Obx(
      () => Card(
        elevation: 4.0,
        child: ListTile(
          leading: Image.asset(linkAsset),
          title: Text(titleText),
          subtitle: Text(subtitleText,
              style: const TextStyle(color: Color(0xFF00623B))),
          trailing: Card(
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: cartController.quantityDecrement,
                      icon: const Icon(Icons.remove),
                    ),
                    Text("${cartController.quantity}"),
                    IconButton(
                      onPressed: cartController.quantityIncrement,
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
