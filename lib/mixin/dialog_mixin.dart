import 'package:flutter/material.dart';
import 'package:getjoke/common/ui_components/c_container.dart';
import 'package:getjoke/common/ui_components/c_text.dart';
import 'package:getjoke/core/routes/router_table.dart';

mixin DialogsMixin {
  final _dialogContext = rootNavigatorKey.currentContext!;
  showAlertDialog({
    String? content,
    String? buttonTitle,
    VoidCallback? onTapClose,
    bool? barrierDismissible,
  }) {
    showGeneralDialog(
        barrierLabel: "Barrier",
        barrierDismissible: barrierDismissible ?? true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 300),
        context: _dialogContext,
        pageBuilder: (_, __, ___) {
          return Align(
            alignment: Alignment.center,
            child: IntrinsicHeight(
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: CText(
                              maxLine: 10,
                              lineSpacing: 1.5,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              textAlign: TextAlign.center,
                              text: content,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    CContainer(
                      onTap: () {
                        dissmissDialog();
                        onTapClose?.call();
                      },
                      width: double.infinity,
                      height: 48,
                      child: const Center(
                        child: CText(
                          fontSize: 15,
                          textAlign: TextAlign.center,
                          text: 'Close',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<void> dissmissDialog() async {
    Navigator.pop(_dialogContext);
    return;
  }
}
