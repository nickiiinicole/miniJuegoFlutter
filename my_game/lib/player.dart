import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

enum PlayerState { idle }

class Player extends SpriteAnimationGroupComponent<PlayerState>
    with HasGameRef {
  Player() : super(size: Vector2.all(32));

  @override
  Future<void> onLoad() async {
    await super.onLoad();

final image = await gameRef.images.load('atlas.png');
    final spriteSheet = SpriteSheet(image: image, srcSize: Vector2(32, 32));

    animations = {
      PlayerState.idle:
          spriteSheet.createAnimation(row: 1, from: 0, to: 3, stepTime: 0.2),
    };

    current = PlayerState.idle;
    position = Vector2(100, 100);
    anchor = Anchor.center;
  }
}
