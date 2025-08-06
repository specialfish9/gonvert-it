import 'dart:io';

import 'package:dio/dio.dart';
import 'package:frontend/repository/models/json_operation.dart';
import 'package:frontend/ui/pages/home/pages/split/split_page.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'pdf_repository.g.dart';

const pdfPart = Part(name: "file", contentType: "application/pdf");

@RestApi(baseUrl: 'http://127.0.0.1:8081/api/v1/pdf')
abstract class PdfRepository {
  @factoryMethod
  factory PdfRepository(Dio dio, {String? baseUrl}) = _PdfRepository;

  /// Split a PDF file into multiple files, returning a zip file containing all parts.
  @POST('/split')
  @MultiPart()
  @DioResponseType(ResponseType.bytes)
  Future<List<int>> split(@pdfPart File file);

  @POST('/merge')
  @MultiPart()
  @DioResponseType(ResponseType.bytes)
  Future<List<int>> merge(@pdfPart File file);
}

extension PdfRepositoryExt on PdfRepository {
  /// Available operations for PDF files (hardcoded).
  List<JsonOperation> get operations => [
    JsonOperation(
      name: 'Merge',
      code: JsonOperationCode.merge,
      description: 'Merge multiple PDF files into one.',
      route: '',
    ),
    JsonOperation(
      name: 'Split',
      code: JsonOperationCode.split,
      description: 'Split a PDF into multiple files.',
      route: SplitRoute.buildLocation()
    ),
  ];
}
