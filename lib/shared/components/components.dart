import 'package:flutter/material.dart';

TextFormField defaultTextFormFieled(
    {@required TextEditingController controller,
    @required TextInputType textInputType,
    @required IconData iconPrefix,
    IconData iconSuffix,
    @required String text,
    @required Function validator,
    Function onTap,
    Function onChanged,
    Function onSubmitted}) {
  return TextFormField(
    controller: controller,
    keyboardType: textInputType,
    decoration: InputDecoration(
      prefixIcon: Icon(iconPrefix),
      suffixIcon: iconSuffix != null ? Icon(iconSuffix) : null,
      hintText: text,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
    ),
    validator: validator,
    onTap: onTap,
    onFieldSubmitted: onSubmitted,
    onChanged: onChanged,
  );
}

Widget imageNetworkCached(String url) {
  return Image.network(
    url,
    fit: BoxFit.fill,
    errorBuilder: (context, error, stackTrace) => Center(
        child: Text(
      'لا توجد صورة',
      overflow: TextOverflow.ellipsis,
    )),
  );
}
