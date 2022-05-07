part of '../view/detail_view.dart';

class DetailChart extends StatelessWidget {
  const DetailChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ChipList(
          chipList: ['1d', '1w', '1m', '3g', '6m', '1y'],
          backgroundColor: Colors.transparent,
        ),
        SizedBox(
          height: SizeConfig.screenHeight * .25,
          width: double.infinity,
          child: CustomPaint(
            painter: BacgroundPaint(),
            child: LineChart(
              LineChartData(
                //Arkaplandaki gridleri kapatır
                gridData: FlGridData(show: false),
                clipData: FlClipData.all(),
                titlesData: FlTitlesData(show: false),
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                      spots: const [
                        FlSpot(0, 3),
                        FlSpot(2.6, 2),
                        FlSpot(4, 3),
                        FlSpot(5, 1),
                        FlSpot(6, 2),
                        FlSpot(7, 2),
                        FlSpot(9, 4),
                        FlSpot(10, 3),
                        FlSpot(11, 5),
                      ],
                      isCurved: false,
                      color: Colors.green.withOpacity(0.8),
                      dotData: FlDotData(show: false))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BacgroundPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.shader = RadialGradient(colors: [
      Colors.grey.withOpacity(0.2),
      Colors.transparent,
    ]).createShader(Rect.fromCircle(
      center: Offset(SizeConfig.screenWidth / 2.1, SizeConfig.screenWidth / 2 * 3 / 7),
      radius: SizeConfig.screenWidth / 1.8,
    ));

    final heightLine = height ~/ 8; // your Horizontal line
    final widthLine = (width ~/ 12); // your Vertical line

    for (int i = 1; i < height; i++) {
      if (i % heightLine == 0) {
        Path linePath = Path();
        linePath.addRect(Rect.fromLTRB(0, i.toDouble(), width, (i + 1).toDouble()));
        canvas.drawPath(linePath, paint);
      }
    }
    for (int i = 1; i < width; i++) {
      if (i % widthLine == 0) {
        Path linePath = Path();
        linePath.addRect(Rect.fromLTRB(i.toDouble(), 0, (i + 1).toDouble(), height));
        canvas.drawPath(linePath, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
