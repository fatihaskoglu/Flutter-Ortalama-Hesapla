import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama/constans/app_constans.dart';
import 'package:ortalama_hesaplama/helper/data_helper.dart';

class HarfDropDownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  HarfDropDownWidget({required this.onHarfSecildi, Key? key}) : super(key: key);

  @override
  _HarfDropDownWidgetState createState() => _HarfDropDownWidgetState();
}

class _HarfDropDownWidgetState extends State<HarfDropDownWidget> {
  double secilenHarfDeger = 4; //not degeri ona göre

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropdownpadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
          elevation: 16,
          iconEnabledColor: Sabitler.anaRenk.shade200,
          value: secilenHarfDeger,
          onChanged: (deger) {
            setState(() {
              secilenHarfDeger = deger!;
              widget.onHarfSecildi(secilenHarfDeger);
            });
          },
          underline: Container(),
          items: DataHelper.tumDerslerinHarfleri()),
    );
  }
}
