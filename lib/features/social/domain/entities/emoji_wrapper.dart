import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:equatable/equatable.dart';

class EmojiWrapper extends Equatable {
  final Emoji emoji;
  const EmojiWrapper(this.emoji);

  Emoji toEmoji() {
    return Emoji(
      emoji.emoji,
      emoji.name,
      hasSkinTone: emoji.hasSkinTone,
    );
  }

  factory EmojiWrapper.fromEmoji(Emoji emoji) {
    return EmojiWrapper(emoji);
  }

  @override
  List<Object?> get props => [
        emoji.name,
        emoji.emoji,
        emoji.hasSkinTone,
      ];
}
