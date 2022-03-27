import 'package:dinamik_not_ortalamasi/constants/app_constant.dart';
import 'package:dinamik_not_ortalamasi/helper/data_helper.dart';
import 'package:dinamik_not_ortalamasi/model/ders.dart';
import 'package:dinamik_not_ortalamasi/widgets/ders_listesi.dart';
import 'package:dinamik_not_ortalamasi/widgets/harf_dropdown_widget.dart';
import 'package:dinamik_not_ortalamasi/widgets/kredi_dropdown_widget.dart';
import 'package:dinamik_not_ortalamasi/widgets/ortalama_goster_widget.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaApp extends StatefulWidget {
  const OrtalamaHesaplaApp({Key? key}) : super(key: key);

  @override
  State<OrtalamaHesaplaApp> createState() => _OrtalamaHesaplaAppState();
}

class _OrtalamaHesaplaAppState extends State<OrtalamaHesaplaApp> {
  var formKey = GlobalKey<FormState>();
  double secilenHarf = 4;
  double secilenKredi = 1;
  String girilenDersAdi = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            Constants.title,
            style: Constants.style,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(
                  dersSayisi: DataHelper.tumEklenenDersler.length,
                  ortalama: DataHelper.ortalamaHesapla(),
                ),
              ),
            ],
          ),
          Expanded(
            child: DersListesi(
              onDismiss: (index) {
                setState(() {
                  DataHelper.tumEklenenDersler.removeAt(index);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Constants.yatayPadding8,
            child: _buildTextFormField(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //2 Dropdown
              Expanded(
                child: Padding(
                  padding: Constants.yatayPadding8,
                  child: HarfDropdownWidget(
                    onHarfSecildi: (harf) {
                      secilenHarf = harf!;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Constants.yatayPadding8,
                  child: KrediDropdownWidget(
                    onKrediSecildi: (kredi) {
                      secilenKredi = kredi;
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      formKey.currentState!.save();
                      var eklenecekDers = Ders(
                          isim: girilenDersAdi,
                          harfDegeri: secilenHarf,
                          krediDegeri: secilenKredi);
                      DataHelper.dersEkle(eklenecekDers);
                    });
                  }
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                ),
                color: Constants.anaRenk,
                iconSize: 30,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (value) {
        if (value!.length <= 0) {
          return 'Ders adını giriniz';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: 'Matematik',
        border: OutlineInputBorder(
          borderRadius: Constants.borderRadius,
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Constants.anaRenk.shade100.withOpacity(0.3),
      ),
    );
  }
}
