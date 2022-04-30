import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Container defaultButton(
    {double? width = double.infinity,
    Color color = Colors.blue,
    Gradient? gradient,
    bool isUpperCase = true,
    double? radius,
    double? fontSize,
    required VoidCallback function,
    required String txt}) {
  return Container(
    width: width,
    decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        borderRadius: BorderRadius.circular(radius!)),
    child: MaterialButton(
      onPressed: function,
      child: Text(isUpperCase ? txt.toUpperCase() : txt,
          style: TextStyle(color: Colors.white, fontSize: fontSize)),
    ),
  );
}

Widget defaultTextFormField({
  required TextEditingController controller,
  TextInputType? type,
  ValueChanged? onSubmit,
  ValueChanged? onChange,
  required FormFieldValidator validator,
  required String labelTxt,
  required IconData prefixIcon,
  IconData? suffixIcon,
  VoidCallback? suffixOnPressed,
  bool obscureText = false,
  List<TextInputFormatter>? inputFormatter,
  GestureTapCallback? onTap,
  bool readOnly = false,
  bool showCursor = false,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    obscureText: obscureText,
    onFieldSubmitted: onSubmit,
    onChanged: onChange,
    validator: validator,
    onTap: onTap,
    readOnly: readOnly,
    showCursor: showCursor,

    // ADD LIMIT TO (TextFormField)
    // inputFormatters: [
    //   LengthLimitingTextInputFormatter(5),
    //   FilteringTextInputFormatter.digitsOnly
    // ],
    inputFormatters: inputFormatter,

    decoration: InputDecoration(
        labelText: labelTxt,
        prefixIcon: Icon(prefixIcon),
        suffixIcon:
            IconButton(icon: Icon(suffixIcon), onPressed: suffixOnPressed),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        )),
  );
}

Widget buildNewsItem(dataList) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children: [
        Container(
          height: 125,
          width: 125,
          child:dataList['urlToImage']!=null? ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FadeInImage(
              image: NetworkImage(
                  '${dataList['urlToImage']}'
              ),
              placeholder: AssetImage('assets/images/photo.png'),
              fit: BoxFit.cover,
            ),
          ):ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image( image: AssetImage('assets/images/no-pictures (1).png'),fit: BoxFit.cover),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Container(
            height: 125,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${dataList['title']}',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '${dataList['publishedAt']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

// Widget appNoData(
//     {required IconData icon, Color color = Colors.blue, required String txt}) {
//   return Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(icon, size: 100, color: color),
//         SizedBox(
//           height: 10,
//         ),
//         Text(txt, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//       ],
//     ),
//   );
// }

// Bottom Navigation Bar

// bottomNavigationBar: BottomNavigationBar(
//   type: BottomNavigationBarType.fixed,
//   elevation: 30,
//   currentIndex: cubit.currentIndex,
//   onTap: (index) {
//
//     cubit.changeIndex(index);
//     // setState(() {
//     //   _currentIndex = index;
//     // });
//     print("On Tap Index ==> $index");
//   },
//   items: [
//     BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Tasks"),
//     BottomNavigationBarItem(
//         icon: Icon(Icons.check_circle_outline), label: "Done"),
//     BottomNavigationBarItem(
//         icon: Icon(Icons.archive_outlined), label: "Archived"),
//   ],
// )
