import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama/constans/app_constans.dart';
import 'package:ortalama_hesaplama/helper/data_helper.dart';

class KrediDropdownWidget extends StatefulWidget {
  final Function onKrediSecildi;
  KrediDropdownWidget({required this.onKrediSecildi, Key? key})
      : super(key: key);

  @override
  _KrediDropdownWidgetState createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
  double secilenKrediDegeri = 1; //harf değeri
  
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
          value: secilenKrediDegeri,
          onChanged: (deger) {
            setState(() {
              secilenKrediDegeri = deger!;
              widget.onKrediSecildi(secilenKrediDegeri);
            });
          },
          underline: Container(),
          items: DataHelper.tumDersKredileri()),
    );
  }
}
