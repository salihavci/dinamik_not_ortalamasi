import 'package:dinamik_not_ortalamasi/constants/app_constant.dart';
import 'package:dinamik_not_ortalamasi/helper/data_helper.dart';
import 'package:flutter/material.dart';

class HarfDropdownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  const HarfDropdownWidget({required this.onHarfSecildi, Key? key})
      : super(key: key);

  @override
  State<HarfDropdownWidget> createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
  double secilenHarf = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropdownPadding,
      decoration: BoxDecoration(
        color: Constants.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Constants.anaRenk.shade200,
        value: secilenHarf,
        items: DataHelper.tumDerslerinHarfleri(),
        underline: Container(),
        onChanged: (secilenDeger) {
          setState(() {
            secilenHarf = secilenDeger!;
            print("Deger : $secilenHarf");
            widget.onHarfSecildi(secilenHarf);
          });
        },
      ),
    );
  }
}
