import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

void main() async {
  final router = Router()..get('/', _getIndex);
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(router);
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, InternetAddress.anyIPv4, port);
  print('Started server on ${server.address.host}:${server.port}');
}

Response _getIndex(Request request) => Response.ok('Hello Fluttorium!');
