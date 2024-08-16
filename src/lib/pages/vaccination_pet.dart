import '../utils/app_export.dart';

final Map<String, dynamic> examplePet = {
  'sahip': 'TECHBLUE',
  'isim': 'Beyaz Diş',
  'son_asi': '23/10/2023 İç Parazit\n22/09/2023 Dış Parazit',
  'asilar': ['İç Parazit', 'Dış Parazit', 'Diğer Aşılar', 'Dış Parazit', 'Diğer Aşılar', 'Dış Parazit', 'Diğer Aşılar', 'Dış Parazit', 'Diğer Aşılar', 'Dış Parazit', 'Diğer Aşılar'],
};

class VaccinationPet extends StatefulWidget {
  final Map<String, dynamic> pet;
  const VaccinationPet({Key? key, required this.pet}) : super(key: key);

  @override
  State<VaccinationPet> createState() => _VaccinationPetState();
}

class _VaccinationPetState extends State<VaccinationPet> {
  @override
  Widget build(BuildContext context) {
    List<String> asilarListesi = widget.pet['asilar'];

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: CustomArrowBack(),
                    ),
                    CustomLogo(),
                    CustomImageView(
                      imagePath: ImageConstant.imgPet2PP,
                      height: 120.adaptSize,
                      width: 120.adaptSize,
                      radius: BorderRadius.circular(50.h),
                      margin: EdgeInsets.only(right: 6.h),
                    ),
                    SizedBox(
                      height: 15.v,
                    ),
                    _customInfoWidget(
                      context,
                      'Sahip: ${widget.pet['sahip']}',
                      'İsim: ${widget.pet['isim']}',
                      'Son Aşılar :\n${widget.pet['son_asi']}',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        height: asilarListesi.length * 25.h,
                        child: ListView.builder(
                          itemCount: asilarListesi.length,
                          itemBuilder: (BuildContext context, int index) {
                            return buildVaccinationCard(context, asilarListesi[index]);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _customInfoWidget(
      BuildContext context, String text1, String text2, String text3) {
    return Column(children: [
      SizedBox(height: 2.v),
      Container(
        decoration: BoxDecoration(
            color: appTheme.blueGray100.withOpacity(0.8),
            borderRadius: BorderRadius.circular(30.h)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text1, style: CustomTextStyles.bodyLargeTillanaBlack900),
                Text(text2, style: CustomTextStyles.bodyLargeTillanaBlack900),
                Text(text3, style: CustomTextStyles.bodyLargeTillanaBlack900),
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  Widget buildVaccinationCard(BuildContext context, String vaccinationName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.vaccinationInf);
        },
        child: Container(
          decoration: BoxDecoration(
              color: appTheme.blueGray100.withOpacity(0.8),
              borderRadius: BorderRadius.circular(30.h)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(vaccinationName,
                  style: CustomTextStyles.bodyLargeTillanaBlack900),
            ),
          ),
        ),
      ),
    );
  }
}
