import 'package:dio/dio.dart';
import 'package:memes_demoapp_api/Model/Meme_Model.dart';

class MemeAPi {
  static Future<List<Data>> FetchMemes(int pages) async {
    Response response =
        await Dio().get('https://alpha-meme-maker.herokuapp.com/$pages/');

    return (response.data['data'] as List)
        .map((e) => Data.fromJson(e))
        .toList();
  }
}
