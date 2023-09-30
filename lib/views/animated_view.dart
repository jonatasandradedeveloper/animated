import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimatedView extends StatefulWidget {
  const AnimatedView({super.key});

  @override
  State<AnimatedView> createState() => _AnimatedViewState();
}

// Verifique se você está tentando essas animações em um
//arquivo Stateful Widget. Além disso, lembre-se de incluir
//SingleTickerProviderStateMixin na definição de classe.
//Isso lida com o tempo de animação.

class _AnimatedViewState extends State<AnimatedView>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  // AnimatedBuilder Widget é um widget universalmente útil para criar
  //animações. AnimatedBuilder Widget é útil para widgets mais complexos
  //que desejam incorporar animação como um componente de uma função de
  //construção maior. Para utilizar o AnimatedBuilder, basta desenvolver
  //o widget e passar a ele uma função de construtor.

  @override
  void initState() {
    //No método initState() , adicionaremos _controller, ou seja,
    //igual ao AnimationController() .
    //Dentro do AnimationController, adicionaremos a duração de 8 segundos

    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20), // Velocidade da rotação
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.lightBlue,
          ),
          builder: (BuildContext context, Widget? child) {
            //Retornaremos um widget
            //Transform.rotate() . Neste widget,
            //adicionaremos meios de ângulo que
            //fornecem a rotação no sentido horário
            return Transform.rotate(
              angle: _controller.value * 2 * math.pi,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
