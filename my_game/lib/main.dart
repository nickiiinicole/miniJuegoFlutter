import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    super.onLoad();

    final map = await TiledComponent.load(
      'maps/map1.tmx', 
      Vector2.all(16),     // valor del tiled de tamaño 32,
    );

    add(map);
  }
}
