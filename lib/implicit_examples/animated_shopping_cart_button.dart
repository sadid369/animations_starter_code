import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isPressed = !isPressed;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 2000),
            width: isPressed ? 200 : 80.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: isPressed ? Colors.green : Colors.blue,
              borderRadius: isPressed
                  ? BorderRadius.circular(50)
                  : BorderRadius.circular(10.0),
            ),
            child: isPressed
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                      const Text(
                        'Added to Cart',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
                : const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
          ),
        ),
      ),
    );
  }
}
