import '../utils/app_export.dart';

final List<String> exampleDates = [
  "11/11/2023",
  "11/11/2023",
  "11/11/2023",
  "11/11/2023",
  "11/11/2023"
];
final List<String> exampleContents = [
  "Aldığımız hizmetten gerçekten memnun kaldık. Evden alıp işyerine teslim etmesini rica etmiştik. Kabul etti. Tekrar çalışılır.",
  "Aldığımız hizmetten gerçekten memnun kaldık. Evden alıp işyerine teslim etmesini rica etmiştik. Kabul etti. Tekrar çalışılır.",
  "Aldığımız hizmetten gerçekten memnun kaldık. Evden alıp işyerine teslim etmesini rica etmiştik. Kabul etti. Tekrar çalışılır.",
  "Aldığımız hizmetten gerçekten memnun kaldık. Evden alıp işyerine teslim etmesini rica etmiştik. Kabul etti. Tekrar çalışılır.",
  "Aldığımız hizmetten gerçekten memnun kaldık. Evden alıp işyerine teslim etmesini rica etmiştik. Kabul etti. Tekrar çalışılır."
];
final List<int> exampleRatings = [5, 4, 3, 2, 1];

class ReviewsPageScreen extends StatefulWidget {
  final List<String> dates;
  final List<String> contents;
  final List<int> ratings;
  const ReviewsPageScreen(
      {Key? key,
      required this.dates,
      required this.contents,
      required this.ratings})
      : super(
          key: key,
        );

  @override
  State<ReviewsPageScreen> createState() => _ReviewsPageScreenState();
}

class _ReviewsPageScreenState extends State<ReviewsPageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Column(
                children: [
                  Align(alignment: Alignment.topLeft, child: CustomArrowBack()),
                  CustomLogo(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.v),
                    child: Container(
                      height: 631.v,
                      child: ListView.builder(
                              itemCount: widget.ratings.length,
                              itemBuilder: (BuildContext context, int index) {
                                return _reviewWidget(context, index, widget.dates, widget.contents, widget.ratings);
                              },
                            ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _reviewWidget(BuildContext context, int index, List<String> dates,
      List<String> contents, List<int> ratings) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(bottom: 14.v),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tarih: ${dates[index]}", style: CustomTextStyles.bodyMedium16Italic,),
                ratingWidget(context, ratings[index]),  
              ],
            ),
            Text(contents[index],style: CustomTextStyles.bodyMedium16Italic,),
          ],
        ),
      ),
    );
  }

  Widget ratingWidget(BuildContext context, int rating) {
    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      if (i < rating)
        stars.add(
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 13.adaptSize,
          ),
        );
      else {
        stars.add(Icon(
          Icons.star_border,
          color: Colors.yellow,
          size: 13.adaptSize,
        ));
      }
    };
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: stars,
    );
  }
}
