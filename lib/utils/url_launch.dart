import 'package:super_store_e_commerce_flutter/imports.dart';

class UrlLaunch {
  static Future makePhoneCall({String? phoneNumber}) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  static Future makeEmail({String? email, String? subject, String? body}) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=$subject&body=$body',
    );

    if (await canLaunchUrl(params)) {
      await launchUrl(params);
    } else {
      throw 'Could not launch ${params.toString()}';
    }
  }

  static Future launchInBrowser({String? urlString}) async {
    final Uri url = Uri.parse(urlString!);
    if (await canLaunchUrl(url)) {
      await launchUrl(url,
          mode: LaunchMode.externalApplication,
          webViewConfiguration: const WebViewConfiguration(
            enableJavaScript: true,
          ));
    } else {
      if (kDebugMode) {
        print('Error ${url.toString()}');
      }
      throw 'Could not launch $url';
    }
  }
}
