import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama/model/ders.dart';

class DataHelper {
  static List<Ders> tumEklenenenDersler = [];

  static dersEkle(Ders ders) {
    tumEklenenenDersler.add(ders);
  }

  static double ortalamaHesapla() {
    double toplamNotDegeri = 0;
    double toplamKrediDegeri = 0;

    tumEklenenenDersler.forEach((element) {
      toplamNotDegeri =
          toplamNotDegeri + (element.krediDegeri * element.harfDegeri);
      toplamKrediDegeri += element.krediDegeri;
    });
    return toplamNotDegeri / toplamKrediDegeri;
  }

  static List<String> _tumDerslerinHarfleri() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'CD'];
  }

  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'CD':
        return 1.5;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return _tumDerslerinHarfleri()
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: _harfiNotaCevir(e),
            ))
        .toList();
  }

  static List<int> _tumKrediler() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> tumDersKredileri() {
    return _tumKrediler()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e.toDouble(),
            ))
        .toList();
  }
}
