import '../utils/app_export.dart';

final Map<String, dynamic> vaccinations = {
  'name': 'Beyaz Diş',
  'vaccs': [
    {'name': 'İç Parazit', 'date': '11/7/2023', 'place': 'Gtü Hayvan Bakımevi'},
    {'name': 'İç Parazit', 'date': '11/7/2023', 'place': 'Gtü Hayvan Bakımevi'},
    {'name': 'İç Parazit', 'date': '11/7/2023', 'place': 'Gtü Hayvan Bakımevi'},
    {'name': 'İç Parazit', 'date': '11/7/2023', 'place': 'Gtü Hayvan Bakımevi'}
  ]
};

class VaccinationInf extends StatefulWidget {
  final Map<String, dynamic> vaccs;
  const VaccinationInf({Key? key, required this.vaccs})
      : super(
          key: key,
        );

  @override
  State<VaccinationInf> createState() => _VaccinationInfState();
}

class _VaccinationInfState extends State<VaccinationInf> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final _placeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> names = widget.vaccs.keys.toList();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomArrowBack(),
                      GestureDetector(
                        onTap: () {
                          _addVaccination();
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
                  ...widget.vaccs['vaccs']
                      .map((vacc) => buildVaccCard(context, vacc))
                      .toList(),
                  /*Container(
                    decoration: BoxDecoration(
                        color: appTheme.blueGray100.withOpacity(0.8)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Container(
                          height: 631.v,
                          child: ListView.builder(
                            itemCount: widget.vaccs.length,
                            itemBuilder: (BuildContext context, int index) {
                              return petVaccinations(context, widget.vaccType, names, widget.vaccs, index);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget petVaccinations(BuildContext context, String type, List<String> names,
      Map<String, String> vaccinationInfos, int index) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(
          "Adı: $type\nTarihi: ${names[index]}\nYeri: ${vaccinationInfos[names[index]]}",
          style: CustomTextStyles.bodyMedium15Italic),
    );
  }

  void _showAddPetDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Yeni Aşı Ekle', style: theme.textTheme.titleLarge),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Aşı Adı'),
                    style: CustomTextStyles.bodyMediumTimmana,
                    cursorColor: Colors.black,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen aşı adı girin.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(labelText: 'Tarih'),
                    style: CustomTextStyles.bodyMediumTimmana,
                    cursorColor: Colors.black,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen aşı tarihi girin.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _placeController,
                    decoration: InputDecoration(labelText: 'Yapıldığı yer'),
                    style: CustomTextStyles.bodyMediumTimmana,
                    cursorColor: Colors.black,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen aşının yapıldığı yeri girin.';
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
                  _addVaccination();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildVaccCard(BuildContext context, Map<String, dynamic> vacc) {
    return Card(
      child: ListTile(
        title: Text('Adı: ${vacc['name']}'),
        subtitle: Text('Tarihi: ${vacc['date']}\nYeri: ${vacc['place']}'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () => _removeVaccination(vacc),
        ),
      ),
    );
  }

  _addVaccination() {
    final newVacc = {
      'name': _nameController.text,
      'date': _dateController.text,
      'place': _placeController.text,
    };

    setState(() {
      widget.vaccs['vaccs'].add(newVacc);
    });

    _nameController.clear();
    _dateController.clear();
    _placeController.clear();
  }

  void _removeVaccination(Map<String, dynamic> vaccToRemove) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Aşıyı Sil'),
          content: Text('Bu aşıyı silmek istediğinize emin misiniz?'),
          actions: [
            TextButton(
              child: Text('İptal'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Sil'),
              onPressed: () {
                setState(() {
                  widget.vaccs['vaccs']
                      .removeWhere((pet) => pet == vaccToRemove);
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
