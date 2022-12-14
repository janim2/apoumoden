
  import 'package:flutter/material.dart';

void popupAlert({
    required BuildContext context,title,
    final ontap,
  }) {
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.05),
      transitionDuration: Duration(milliseconds: 200),
      context: context,
      pageBuilder: (dialogContext, anim1, anim2) {
        return Text("");
      },
      transitionBuilder: (dialogContext, anim1, anim2, child) {
        return Transform.scale(
          scale: anim1.value,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Material(
                    elevation: 5.0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 23,
                      ),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // GestureDetector(
                            //   onTap: () {
                            //     Navigator.pop(dialogContext);
                            //   },
                            //   child: Align(
                            //     alignment: Alignment.topRight,
                            //     child: Icon(
                            //       Icons.close,
                            //       color: Colors.black,
                            //       size: ScreenUtil().setSp(20.0),
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: ScreenUtil().setHeight(30.0),
                            // ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                title ?? "",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 21,
                            ),
                            Text("Mention your ID"),
                           SizedBox(
                              height:5,
                            ),
                            TextField(
                              // controller: _textFieldController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '',
                                hintText: '',
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: ontap,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 13,
                                  vertical: 13,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  "Submit",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Note:"),
                            Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed blandit vitae mauris eu malesuada. Morbi facilisis nulla vel dolor malesuada efficitur. Nulla faucibus pellentesque tortor, id finibus diam dignissim non. Sed pretium ante nunc, vitae viverra lectus porta in. Sed suscipit libero quis mi sagittis scelerisque. Curabitur rutrum faucibus porttitor. Morbi pretium nisi nec eros posuere pretium. Aliquam a arcu magna.")
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }