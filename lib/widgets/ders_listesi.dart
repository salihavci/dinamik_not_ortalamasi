import 'package:dinamik_not_ortalamasi/constants/app_constant.dart';
import 'package:dinamik_not_ortalamasi/helper/data_helper.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  final Function onDismiss;
  const DersListesi({required this.onDismiss, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataHelper.tumEklenenDersler.length > 0
        ? ListView.builder(
            itemCount: DataHelper.tumEklenenDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                //Silinecek elemanın key değerine UniqueKey değeri veriyor
                direction: DismissDirection.startToEnd,
                // onDismissed: (direction) {
                //   DataHelper.tumEklenenDersler.removeAt(index);
                // },
                onDismissed: (direction) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(
                        DataHelper.tumEklenenDersler[index].isim,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Constants.anaRenk,
                        child: Text((DataHelper
                                    .tumEklenenDersler[index].harfDegeri *
                                DataHelper.tumEklenenDersler[index].krediDegeri)
                            .toStringAsFixed(0)),
                      ),
                      subtitle: Text(
                          "Kredi Değeri : ${DataHelper.tumEklenenDersler[index].krediDegeri} kredi, Not değeri : ${DataHelper.tumEklenenDersler[index].harfDegeri}"),
                    ),
                  ),
                ),
              );
            })
        : Container(
            child: Center(
              child: Text(
                'Lütfen ders ekleyin',
                style: Constants.style,
              ),
            ),
          );
  }
}
