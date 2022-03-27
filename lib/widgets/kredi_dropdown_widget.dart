import 'package:dinamik_not_ortalamasi/constants/app_constant.dart';
import 'package:dinamik_not_ortalamasi/helper/data_helper.dart';
import 'package:flutter/material.dart';

class KrediDropdownWidget extends StatefulWidget {
  final Function onKrediSecildi;
  const KrediDropdownWidget({required this.onKrediSecildi, Key? key})
      : super(key: key);

  @override
  State<KrediDropdownWidget> createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
  double secilenKredi = 1;

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
        value: secilenKredi,
        items: DataHelper.tumDerslerinKredileri(),
        underline: Container(),
        onChanged: (secilenDeger) {
          setState(() {
            secilenKredi = secilenDeger!;
            print("Deger : $secilenKredi");
            widget.onKrediSecildi(secilenKredi);
          });
        },
      ),
    );
  }
}
