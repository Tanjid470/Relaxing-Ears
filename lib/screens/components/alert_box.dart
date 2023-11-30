import 'package:flutter/material.dart';
import 'package:musicapp/constants/app_colors.dart';
import 'package:musicapp/constants/textStyle.dart';

  Future<void> alert_dialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text('Feature not available..!',style:Head20Text(AppColors.offpink, 22)),
            backgroundColor: const Color(0XFF292D49),
            content:  SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('This Feature will be added soon...',style:Head20Text(AppColors.offpink, 17),),
                 // Text('It will take few days',style:Head20Text(AppColors.white, 15)),
                ],
              ),
            ),
            actions: <Widget>[
              // TextButton(
              //   child: const Text(
              //     'Approve',
              //   ),
              //   onPressed: () {
              //     Navigator.of(context).pop();
              //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //       content: Text('Done'),
              //       duration: Duration(milliseconds: 1000),
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(10)),
              //     ));
              //   },
              // ),
              TextButton(
                child:  Text(
                  'Ok',style:Head20Text(AppColors.accent, 20),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }