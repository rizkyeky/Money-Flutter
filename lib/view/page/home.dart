part of 'page.dart';

class HomePage extends StatelessWidget {

  final HomeBloc bloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pallets['accent1'],
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24))),
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
                          color: Color(bloc.overview[i]['color'] as int),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: CustomPaint(
                          painter: OverviewBackground(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(bloc.overview[i]['label'] as String, 
                                style: subtitle.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              Text(bloc.overview[i]['total'].toString(),
                                style: subtitle.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
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
    );
  }
}

class HomeBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final circlePaint1 = Paint()
      ..color = pallets['accent2']
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);

    final circlePaint2 = Paint()
      ..color = pallets['accent3']
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);

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

class OverviewBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final circlePaint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    canvas.drawOval(
      Rect.fromCenter(center: Offset(size.width, 0), height: 120, width: 160),
      circlePaint
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

