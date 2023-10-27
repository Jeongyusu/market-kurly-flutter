import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DisableDragExample extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  DisableDragExample({Key? key, required ScrollPhysics physics})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listener(
        onPointerSignal: (ps) {
          if (ps is PointerScrollEvent) {
            double newOffset = _scrollController.offset + ps.scrollDelta.dy;
            if (newOffset < 0) {
              newOffset = 0;
            } else if (newOffset > _scrollController.position.maxScrollExtent) {
              newOffset = _scrollController.position.maxScrollExtent;
            }
            _scrollController.jumpTo(newOffset);
          }
        },
        child: ListView.builder(
          itemCount: 30,
          controller: _scrollController,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              color: index.isEven ? Colors.blue : Colors.green,
            );
          },
        ),
      ),
    );
  }
}
