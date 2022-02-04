import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WidgetUtils {
  static Widget textFormField(String? labelText, String hintText,
      String? Function(String?)? validator, TextEditingController? controller,
      {bool isReadOnly = false,
      TextInputType textInputType = TextInputType.text,
      bool obscure = false,
      int maxLine = 1,
      bool isMaxLine = false,
      Widget? icon,
      Widget? suffixIcon,
      Widget? prefixIcon,
      Key? key,
      int? maxLength,
      bool isLoginForm = false,
      TextInputAction textInputAction = TextInputAction.next}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
      child: TextFormField(
        maxLength: maxLength,
        textInputAction: maxLine > 1 ? null : textInputAction,
        style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w400,
            fontSize: 15,
            letterSpacing: 1),
        key: key,
        autofocus: false,
        keyboardType: textInputType,
        controller: controller,
        validator: validator,
        obscureText: obscure,
        maxLines: maxLine,
        decoration: InputDecoration(
          filled: isLoginForm ? true : null,
          fillColor:
              isLoginForm ? const Color.fromARGB(50, 203, 219, 245) : null,
          enabledBorder: isLoginForm
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.0),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          icon: icon,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          labelText: labelText,
          contentPadding:
              isMaxLine ? null : const EdgeInsets.fromLTRB(10, 0, 10, 0),
        ),
      ),
    );
  }

  static Widget dropDownButton(
      String? hint,
      String? label,
      String _dropDownValue,
      List<dynamic> dropDownItem,
      Function(dynamic)? onChange,
      {String? Function(String?)? validator,
      String? holder,
      Widget? widget}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
      child: Row(
        children: [
          widget ?? const Text(""),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: DropdownButtonFormField2(
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    label: Text("$label")),
                value: holder,
                focusColor: Colors.transparent,
                isExpanded: true,
                hint: Text(
                  '$hint',
                  style: const TextStyle(fontSize: 14),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 30,
                buttonHeight: 60,
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                items: dropDownItem
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ))
                    .toList(),
                validator: validator,
                onChanged: onChange,
                dropdownPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void showToast(String message, BuildContext context) {
    Fluttertoast.showToast(
        msg: message,
        webPosition: "center",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER);
  }

  static void cancelToast() {
    Fluttertoast.cancel();
  }

  static styledButton(String BtnName, Function()? onPressed) {
    return RaisedButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.redAccent, Colors.pinkAccent]),
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 240.0, maxHeight: 40.0),
          alignment: Alignment.center,
          child: Text(
            BtnName,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  static confirmDialog(
    String? title,
    Function()? onPressed,
    BuildContext context,
  ) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("$title"),
          actions: [
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.red,
                    elevation: 5,
                  ),
                  child: const Text("ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )),
          ],
        );
      },
    );
  }

  static Widget buildTable(
    List<String> headers,
    List<DataRow> rows,
  ) {
    return DataTable(
      showCheckboxColumn: false,
      showBottomBorder: true,
      horizontalMargin: 5,
      dividerThickness: 2,
      columnSpacing: 25,
      headingRowColor: MaterialStateColor.resolveWith((states) => Colors.teal),
      columns: _buildTableHeader(headers),
      rows: rows,
    );
  }

  static List<DataColumn> _buildTableHeader(List<String> headers) {
    List<DataColumn> tableHeader;
    tableHeader = headers
        .map((header) => DataColumn(
            label: Text(header,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            numeric: false))
        .toList();
    return tableHeader;
  }

  static Card expandedCard(String question, String ans) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 10.0, left: 6.0, right: 10.0, bottom: 6.0),
        child: ExpansionTile(
          expandedAlignment: Alignment.topLeft,
          initiallyExpanded: false,
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          title: Text(
            question,
            maxLines: 2,
            style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 14),
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
              child: Text(
                ans,
                maxLines: 50,
                style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  static AppBar buildAppBar(BuildContext context, String? name,
      {IconData? icon, Function()? onPressed, bool isDrawer = false}) {
    final title = Text(
      name!,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
          fontSize: 17,
          color: Color.fromARGB(255, 255, 149, 11),
          fontWeight: FontWeight.bold),
    );
    return AppBar(
      leading: icon == null
          ? null
          : IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.blue,
              ),
            ),
      iconTheme: const IconThemeData(color: Colors.blue),
      title: title,
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 222, 240, 253),
      elevation: 0,
    );
  }
}
