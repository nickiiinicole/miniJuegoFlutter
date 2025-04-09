import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flame_tiled/flame_tiled.dart';

import 'player.dart';

class MyGame extends FlameGame with HasCollisionDetection {
  late final Player player;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // 1. Cargar el mapa
    final map = await TiledComponent.load('maps/map1.tmx', Vector2.all(16));
    add(map);

    // 2. Añadir colisiones de la capa 'Collision'
    final collisionLayer = map.tileMap.getLayer<ObjectGroup>('collision');
    if (collisionLayer != null) {
      for (final obj in collisionLayer.objects) {
        add(
          RectangleComponent(
            position: Vector2(obj.x, obj.y),
            size: Vector2(obj.width, obj.height),
            paint: Paint()..color = const Color(0x00000000), // invisible
          )..add(RectangleHitbox()),
        );
      }
    }

    // 3. Añadir el jugador
    player = Player();
    add(player);
  }
}
