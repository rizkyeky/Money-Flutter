part of 'page.dart';

class HomePage extends StatelessWidget {

  final HomeBloc bloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pallets['accent1'],
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.8),
        title: Text('Money',
          style: TextStyle(
            color: pallets['primary'], 
            fontWeight: FontWeight.w700
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          CustomPaint(
            size: MediaQuery.of(context).size,
            painter: HomeBackground(),
            child: ListView(
              children: [
                ValueBuilder<int>(
                  initialValue: 0,
                  builder: (value, update) => Column(
                    children: [
                      SizedBox(
                        height: 260,
                        child: PageView.builder(
                          itemCount: 3,
                          onPageChanged: (value) => update(value),
                          itemBuilder: (_, index) => Padding(
                            padding: const EdgeInsets.all(24),
                            child: Center(child: GlassCard()),
                          ),
                        ),
                      ),
                      DotsIndicator(
                        dotsCount: 3,
                        position: value.toDouble(),
                        decorator: DotsDecorator(
                          activeColor: pallets['primary'],
                          color: Colors.white,
                          activeSize: const Size.square(12),
                          size: const Size.square(8),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.6,
            minChildSize: 0.5,
            initialChildSize: 0.6,
            builder: (_, controller) => DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                border: Border.all(color: Colors.white.withOpacity(0.5),),
                boxShadow: boxShadow
              ),
              child: ListView(
                padding: const EdgeInsets.all(24),
                controller: controller,
                children: [
                  const Text('Overview', style: title,),
                  const SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(bloc.overview.length, (i) => Expanded(
                      child: Container(
                        height: 100,
                        margin: i == 0 ? const EdgeInsets.only(right: 12) : EdgeInsets.zero,
                        padding: const EdgeInsets.only(left: 24),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: pallets['primary'].withOpacity(0.2),
                              offset: const Offset(5,5),
                              blurRadius: 20
                            )
                          ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(bloc.overview[i]['label'] as String, 
                              style: subtitle,
                            ),
                            Text(bloc.overview[i]['total'].toString(),
                              style: subtitle.copyWith(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),).toList()
                  )
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        highlightElevation: 0,
        backgroundColor: Colors.white.withOpacity(0.8),
        onPressed: () {},
        child: Icon(Icons.add, color: pallets['primary'],),
      ),
    );
  }
}

class HomeBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final circlePaint1 = Paint()
      ..color = pallets['accent2']
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 30);

    final circlePaint2 = Paint()
      ..color = pallets['accent3']
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 30);

    canvas.drawCircle(Offset(size.width - 80, 100), 90, circlePaint1);
    canvas.drawCircle(Offset(-20, size.height*0.5), 120, circlePaint1);
    canvas.drawCircle(Offset(size.width*0.6, 300), 100, circlePaint2);

    canvas.drawCircle(Offset(size.width*0.3, 120), 80, circlePaint2);
    canvas.drawCircle(Offset(-20, size.height*0.8), 120, circlePaint2);
    canvas.drawCircle(Offset(size.width*0.8, size.height*0.7), 100, circlePaint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
