import '../firebase_operations/FirestoreCommunication.dart';
import '../utils/app_export.dart';
import '../global.dart';
import '../classes/pet.dart';



final Map<String, dynamic> exampleUser = {


  'username': acc.getUserName(),
  'phone': acc.getPhoneNumb(),
  'email': acc.getMail(),
  'location': acc.getLocation(),
  'pets': acc.getPetList().map((v) => v.petInfoMap())
  ,
};

class ProfilePage extends StatefulWidget {
  final Map<String, dynamic> user;

  ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _birthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int petCount = widget.user['pets']?.length;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomArrowBack(),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _onTapAds();
                          },
                          child: Container(
                              width: 40.adaptSize,
                              height: 40.adaptSize,
                              child: Icon(
                                Icons.note_alt_outlined,
                                color: Color(0xFFCC986E),
                                size: 40.adaptSize,
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            _showAddPetDialog();
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
                    )
                  ],
                ),
                Column(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgProfile,
                      height: 120.adaptSize,
                      width: 120.adaptSize,
                      radius: BorderRadius.circular(50.h),
                      margin: EdgeInsets.only(right: 6.h),
                    ),
                    _customNicknameWidget(context, widget.user['username']),
                    SizedBox(
                      height: 15.v,
                    ),
                    _customInfoWidget(
                        context,
                        'Telefon: ${widget.user['phone']}',
                        'Mail: ${widget.user['email']}',
                        'İlçe: ${widget.user['location']}',
                        'Kayıtlı Hayvan Sayısı: ${widget.user['pets']?.length ?? 0}'),
                    SizedBox(
                      height: 15.v,
                    ),
                    ...widget.user['pets']
                        .map((pet) => buildPetCard(context, pet))
                        .toList(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _customNicknameWidget(BuildContext context, String text) {
    return Column(children: [
      SizedBox(height: 2.v),
      Align(
          alignment: Alignment.topLeft,
          child: Text("Kullanıcı Adı",
              style: CustomTextStyles.bodyLargeTillanaBlack900)),
      SizedBox(height: 2.v),
      Container(
        height: 55.v,
        decoration: BoxDecoration(
            color: appTheme.blueGray100.withOpacity(0.8),
            borderRadius: BorderRadius.circular(30.h)),
        child: Center(
            child:
                Text(text, style: CustomTextStyles.bodyLargeTillanaBlack900)),
      ),
    ]);
  }

  Widget _customInfoWidget(BuildContext context, String text1, String text2,
      String text3, String text4) {
    return Column(children: [
      SizedBox(height: 2.v),
      Align(
          alignment: Alignment.topLeft,
          child: Text("İletişim Bilgileri",
              style: CustomTextStyles.bodyLargeTillanaBlack900)),
      SizedBox(height: 2.v),
      Container(
        height: 140.v,
        decoration: BoxDecoration(
            color: appTheme.blueGray100.withOpacity(0.8),
            borderRadius: BorderRadius.circular(30.h)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(text1, style: CustomTextStyles.bodyLargeTillanaBlack900),
              Text(text2, style: CustomTextStyles.bodyLargeTillanaBlack900),
              Text(text3, style: CustomTextStyles.bodyLargeTillanaBlack900),
              Text(text4, style: CustomTextStyles.bodyLargeTillanaBlack900),
            ],
          ),
        ),
      ),
    ]);
  }

  Widget buildPetCard(BuildContext context, Map<String, dynamic> pet) {
    return Card(
      child: ListTile(
        title: Text('İsim: ${pet['Name']}'),
        subtitle: Text('Doğum Yılı: ${pet['Birth Date']}'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () => _removePet(pet),
        ),
      ),
    );
  }

  void _showAddPetDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Evcil Hayvan Ekle', style: theme.textTheme.titleLarge),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'İsim'),
                    style: CustomTextStyles.bodyMediumTimmana,
                    cursorColor: Colors.black,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen ismini girin.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _birthController,
                    decoration: InputDecoration(labelText: 'Doğum Yılı'),
                    style: CustomTextStyles.bodyMediumTimmana,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen doğum yılını girin.';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              child: Text('İptal'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Ekle'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _addPet();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  _onTapAds() {
    Navigator.pushNamed(context, AppRoutes.adsPageScreen);
  }

  void _addPet() {
    final newPet = {
      'Name': _nameController.text,
      'Birth Date' : _birthController.text,
    };

    setState(() {
      Pet newPet1= Pet(_nameController.text,DateTime(int.parse(_birthController.text)),acc.getMail(),[]);
      acc.addPetToAcc(newPet1);
      FirestoreCommunication fsc1 = FirestoreCommunication();
      fsc1.addToFirestore(acc);
    });

    _nameController.clear();
    _birthController.clear();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _birthController.dispose();
    super.dispose();
  }

  void _removePet(Map<String, dynamic> petToRemove) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Evcil Hayvanı Sil'),
          content: Text('Bu evcil hayvanı profilinizden silmek istediğinize emin misiniz?'),
          actions: [
            TextButton(
              child: Text('İptal'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Sil'),
              onPressed: () {
                setState(() {
                  widget.user['pets'].removeWhere((pet) => pet == petToRemove);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
