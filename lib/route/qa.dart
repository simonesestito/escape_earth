import 'package:escape_earth/view/RocketHero.dart';
import 'package:flutter/material.dart';

class QaRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          GestureDetector(
            child: RocketHero(),
            onTap: () => Navigator.of(context).pop(),
            onVerticalDragEnd: (_) => Navigator.of(context).pop(),
          ),
          // TODO Q&A
          Text(
              """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent viverra facilisis libero, non imperdiet magna varius in. Integer placerat porta leo quis hendrerit. Nullam mattis porttitor neque, at tempus quam fermentum eget. Proin faucibus lacus in sapien faucibus tincidunt. Donec elementum mollis justo, eget rutrum metus lacinia vel. Sed blandit viverra fringilla. Nunc vel ligula eleifend, convallis nulla vitae, imperdiet erat.

Sed malesuada ac neque non varius. Quisque sollicitudin magna a ullamcorper aliquam. Suspendisse et consequat quam. Praesent aliquam arcu ac massa volutpat, sed posuere nunc sollicitudin. Quisque non sapien ultrices, tristique enim eu, efficitur risus. Etiam efficitur ligula in sagittis feugiat. Nam id nisi ut dolor ultrices iaculis. Nulla rhoncus varius consectetur. Nunc pharetra urna in varius fermentum. Nunc pulvinar purus purus, nec laoreet ex fermentum a. Vivamus suscipit elementum dolor, nec mollis dolor fermentum id. Vestibulum vehicula mauris in sem scelerisque dignissim.

Morbi posuere ultrices leo dapibus varius. Nunc eros massa, bibendum sed quam non, varius efficitur magna. Aliquam sed tellus non sapien bibendum efficitur quis in justo. Aliquam vitae dolor congue, malesuada erat at, congue velit. Ut scelerisque felis nec molestie vehicula. Mauris sit amet mauris metus. Etiam leo tellus, pulvinar ac dignissim ut, facilisis vel nunc.

Curabitur ante leo, sollicitudin elementum viverra vitae, dignissim venenatis lorem. In eu felis ac augue vehicula mattis at eu ligula. Etiam et justo ipsum. Sed vitae consectetur turpis. Vestibulum ultrices dolor vestibulum tortor faucibus accumsan. Sed eget ante dolor. Nullam sollicitudin luctus ligula, et tincidunt velit. Morbi porta volutpat sapien, in dictum ipsum euismod in. Sed quis arcu sagittis, euismod risus eu, bibendum turpis. Morbi eleifend ligula tempus nulla auctor aliquet. In hac habitasse platea dictumst. Vivamus vestibulum at nibh eu mattis. Duis consectetur ipsum at velit mattis, sit amet ullamcorper ligula mattis. Sed varius efficitur urna. Quisque enim nunc, malesuada nec pulvinar at, auctor eget dolor. Cras tempus nunc id ex convallis, nec imperdiet libero tempus.

Aliquam erat volutpat. Nulla arcu quam, placerat vel est et, rutrum dignissim libero. Aenean venenatis dolor id sem lobortis vulputate. Etiam nisi augue, feugiat ut libero vitae, dignissim commodo odio. Phasellus congue lacus eget molestie consectetur. Cras vestibulum lorem in ligula eleifend molestie. Phasellus a ex libero. In ut libero sed nulla mattis vulputate. Mauris faucibus purus ante, facilisis condimentum augue varius sit amet. Cras cursus justo nisl, at ultricies enim ultricies at. Nulla maximus, ex id eleifend venenatis, augue diam sagittis augue, consectetur porta enim dui vitae lectus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent viverra facilisis libero, non imperdiet magna varius in. Integer placerat porta leo quis hendrerit. Nullam mattis porttitor neque, at tempus quam fermentum eget. Proin faucibus lacus in sapien faucibus tincidunt. Donec elementum mollis justo, eget rutrum metus lacinia vel. Sed blandit viverra fringilla. Nunc vel ligula eleifend, convallis nulla vitae, imperdiet erat.

Sed malesuada ac neque non varius. Quisque sollicitudin magna a ullamcorper aliquam. Suspendisse et consequat quam. Praesent aliquam arcu ac massa volutpat, sed posuere nunc sollicitudin. Quisque non sapien ultrices, tristique enim eu, efficitur risus. Etiam efficitur ligula in sagittis feugiat. Nam id nisi ut dolor ultrices iaculis. Nulla rhoncus varius consectetur. Nunc pharetra urna in varius fermentum. Nunc pulvinar purus purus, nec laoreet ex fermentum a. Vivamus suscipit elementum dolor, nec mollis dolor fermentum id. Vestibulum vehicula mauris in sem scelerisque dignissim.

Morbi posuere ultrices leo dapibus varius. Nunc eros massa, bibendum sed quam non, varius efficitur magna. Aliquam sed tellus non sapien bibendum efficitur quis in justo. Aliquam vitae dolor congue, malesuada erat at, congue velit. Ut scelerisque felis nec molestie vehicula. Mauris sit amet mauris metus. Etiam leo tellus, pulvinar ac dignissim ut, facilisis vel nunc.

Curabitur ante leo, sollicitudin elementum viverra vitae, dignissim venenatis lorem. In eu felis ac augue vehicula mattis at eu ligula. Etiam et justo ipsum. Sed vitae consectetur turpis. Vestibulum ultrices dolor vestibulum tortor faucibus accumsan. Sed eget ante dolor. Nullam sollicitudin luctus ligula, et tincidunt velit. Morbi porta volutpat sapien, in dictum ipsum euismod in. Sed quis arcu sagittis, euismod risus eu, bibendum turpis. Morbi eleifend ligula tempus nulla auctor aliquet. In hac habitasse platea dictumst. Vivamus vestibulum at nibh eu mattis. Duis consectetur ipsum at velit mattis, sit amet ullamcorper ligula mattis. Sed varius efficitur urna. Quisque enim nunc, malesuada nec pulvinar at, auctor eget dolor. Cras tempus nunc id ex convallis, nec imperdiet libero tempus.

Aliquam erat volutpat. Nulla arcu quam, placerat vel est et, rutrum dignissim libero. Aenean venenatis dolor id sem lobortis vulputate. Etiam nisi augue, feugiat ut libero vitae, dignissim commodo odio. Phasellus congue lacus eget molestie consectetur. Cras vestibulum lorem in ligula eleifend molestie. Phasellus a ex libero. In ut libero sed nulla mattis vulputate. Mauris faucibus purus ante, facilisis condimentum augue varius sit amet. Cras cursus justo nisl, at ultricies enim ultricies at. Nulla maximus, ex id eleifend venenatis, augue diam sagittis augue, consectetur porta enim dui vitae lectus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent viverra facilisis libero, non imperdiet magna varius in. Integer placerat porta leo quis hendrerit. Nullam mattis porttitor neque, at tempus quam fermentum eget. Proin faucibus lacus in sapien faucibus tincidunt. Donec elementum mollis justo, eget rutrum metus lacinia vel. Sed blandit viverra fringilla. Nunc vel ligula eleifend, convallis nulla vitae, imperdiet erat.

Sed malesuada ac neque non varius. Quisque sollicitudin magna a ullamcorper aliquam. Suspendisse et consequat quam. Praesent aliquam arcu ac massa volutpat, sed posuere nunc sollicitudin. Quisque non sapien ultrices, tristique enim eu, efficitur risus. Etiam efficitur ligula in sagittis feugiat. Nam id nisi ut dolor ultrices iaculis. Nulla rhoncus varius consectetur. Nunc pharetra urna in varius fermentum. Nunc pulvinar purus purus, nec laoreet ex fermentum a. Vivamus suscipit elementum dolor, nec mollis dolor fermentum id. Vestibulum vehicula mauris in sem scelerisque dignissim.

Morbi posuere ultrices leo dapibus varius. Nunc eros massa, bibendum sed quam non, varius efficitur magna. Aliquam sed tellus non sapien bibendum efficitur quis in justo. Aliquam vitae dolor congue, malesuada erat at, congue velit. Ut scelerisque felis nec molestie vehicula. Mauris sit amet mauris metus. Etiam leo tellus, pulvinar ac dignissim ut, facilisis vel nunc.

Curabitur ante leo, sollicitudin elementum viverra vitae, dignissim venenatis lorem. In eu felis ac augue vehicula mattis at eu ligula. Etiam et justo ipsum. Sed vitae consectetur turpis. Vestibulum ultrices dolor vestibulum tortor faucibus accumsan. Sed eget ante dolor. Nullam sollicitudin luctus ligula, et tincidunt velit. Morbi porta volutpat sapien, in dictum ipsum euismod in. Sed quis arcu sagittis, euismod risus eu, bibendum turpis. Morbi eleifend ligula tempus nulla auctor aliquet. In hac habitasse platea dictumst. Vivamus vestibulum at nibh eu mattis. Duis consectetur ipsum at velit mattis, sit amet ullamcorper ligula mattis. Sed varius efficitur urna. Quisque enim nunc, malesuada nec pulvinar at, auctor eget dolor. Cras tempus nunc id ex convallis, nec imperdiet libero tempus.

Aliquam erat volutpat. Nulla arcu quam, placerat vel est et, rutrum dignissim libero. Aenean venenatis dolor id sem lobortis vulputate. Etiam nisi augue, feugiat ut libero vitae, dignissim commodo odio. Phasellus congue lacus eget molestie consectetur. Cras vestibulum lorem in ligula eleifend molestie. Phasellus a ex libero. In ut libero sed nulla mattis vulputate. Mauris faucibus purus ante, facilisis condimentum augue varius sit amet. Cras cursus justo nisl, at ultricies enim ultricies at. Nulla maximus, ex id eleifend venenatis, augue diam sagittis augue, consectetur porta enim dui vitae lectus.""")
        ],
      ),
    );
  }
}
