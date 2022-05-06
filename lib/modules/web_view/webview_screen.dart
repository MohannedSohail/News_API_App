import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../shared/cubit/cubit.dart';

class WebViewScreen extends StatelessWidget {
  final String url;
  final String title;

  WebViewScreen(this.url,this.title);

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
            appBar: AppBar(title: Text("${title}"),),
            body: WebView(
              initialUrl: url,
            ),
          );
        }
  }

