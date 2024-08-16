import '../utils/app_export.dart';

final Map<String, dynamic> exampleUserAd = {
  'username': 'TECHBLUE',
  'ads': [
    {
      'title': 'oy',
      'content':
          'ayayayayayayayayayayayayayayayayayayayayayayayayayayayayayayayay'
    }
  ],
};

class AdsPageScreen extends StatefulWidget {
  final Map<String, dynamic> user;
  const AdsPageScreen({Key? key, required this.user})
      : super(
          key: key,
        );

  @override
  State<AdsPageScreen> createState() => _AdsPageScreenState();
}

class _AdsPageScreenState extends State<AdsPageScreen> {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomArrowBack(),
                      GestureDetector(
                        onTap: () {
                          _onTapAdd1();
                        },
                        child: Container(
                            width: 40.adaptSize,
                            height: 40.adaptSize,
                            child: Icon(
                              Icons.add,
                              color: Color(0xFFCC986E),
                              size: 40.adaptSize,
                            )),
                      ),
                    ],
                  ),
                  CustomLogo(),
                  ...widget.user['ads']
                      .map((ad) => buildAdCard(context, ad))
                      .toList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAdCard(BuildContext context, Map<String, dynamic> ad) {
    return Card(
      child: ListTile(
        title: Text('Başlık: ${ad['title']}'),
        subtitle: Text('İçerik: ${ad['content']}'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () => _removeAd(ad),
        ),
      ),
    );
  }

  void _removeAd(Map<String, dynamic> adToRemove) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('İlanı Kaldır'),
          content: Text('Bu ilanı kaldırmak istediğinize emin misiniz'),
          actions: [
            TextButton(
              child: Text('İptal'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Remove'),
              onPressed: () {
                setState(() {
                  widget.user['ads'].removeWhere((ad) => ad == adToRemove);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _onTapAdd1() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('İlan Oluştur'),
          content: Text('Hangi tür ilan oluşturmak istersiniz?'),
          actions: [
            TextButton(
              child: Text('İş Arıyorum'),
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.workerAdPageScreen),
            ),
            TextButton(
              child: Text('Çalışan Arıyorum'),
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.workAdPageScreen),
            ),
          ],
        );
      },
    );
  }
}
