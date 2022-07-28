import 'package:flutter/material.dart';
import 'package:untitled4/components/widgets/containers/etc/my_custom_scrollView.dart';
import 'package:untitled4/pages/my_drawer.dart';

class MySliverAppBar extends StatefulWidget {
  const MySliverAppBar({Key? key}) : super(key: key);

  @override
  State<MySliverAppBar> createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  final String _description =
      'After such an introduction, I would like to emphasize that there are two types of aurora borealis: '
      'northern and southern. Already by their name it can be understood that the aurora borealis occurs '
      'at the north pole, and the southern aurora borealis - at the south. However, this does not mean that '
      'this miracle of nature can be seen only if the observer is directly at one of the poles./ By the way, '
      'scientists have seen the southern aurora in Australia and even in Greece./n What is the aurora and why '
      'does it occur? What factors influence its shape, color and duration? These and a number of other issues '
      'have always stirred people is minds since ancient times. By the way, the aurora borealis is often mentioned '
      'in the works of Pliny and Aristotle, who tried to explain its nature with the help of reasoning. Most pagan '
      'tribes,who managed to observe a multicolored glow in the sky, explained it quite simply - this is the anger '
      'of the gods,who have shown their strength and warn the disobedient that they are waiting for terrible trials,'
      ' famine, wars,diseases. True, the aurora also terrified more advanced ancient civilizations, for example, the '
      'Roman Empireduring its heyday. The Romans firmly believed that it was the bright glow in the sky that warned '
      'the majestic cityabout the death of the ruler Gaius Julius Caesar./n The peoples living in the north, '
      'accustomed to frequentlyobserving the aurora borealis, were more relaxed about this atmospheric phenomenon. '
      'They explained it quite simply:the reflection of the light of the sun or moon from ice or a sea mirror. '
      'Naturally, they did not associate the auroraborealis with the wrath of supernatural beings, otherwise one '
      'could simply go crazy from the frequency of warnings offuture catastrophes. Northerners living in Russia call '
      'this atmospheric phenomenon in their own way: a flash or a pazor.From the word anchor it is clear that this '
      'word means something like dawn, but the flash characterizes the aurora onlybright scarlet. Such a glow appears '
      'in the place where the fire is raging. In the old days, neighbors often ran to theplace of the aurora during a '
      'flash to help the victims in extinguishing the fire.';

  final String _imageURL =
      "https://vsegda-pomnim.com/uploads/posts/2022-02/1645922158_3-vsegda-pomnim-com-p-polyarnoe-siyanie-foto-3.jpg";
  final String _textTitle = 'The Aurora Borealis';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        drawer: const MyDrawer(),
        body: MyCustomScrollView(
          textTitle: _textTitle,
          description: _description,
          imageURL: _imageURL,
        ),
      ),
    );
  }
}
