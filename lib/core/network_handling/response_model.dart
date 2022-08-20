import '../error_handling/exceptions.dart';


// class ConimalResponse {
//   int totalResults;
//   List<Conimal> results;

//   ConimalResponse({required this.totalResults, required this.results});

//   factory ConimalResponse.fromJson(Map<String, dynamic> json) {
//     try {
//       List<Conimal> list = [];
//       int totalDocuments = json['totalDocuments'];
//       if (json['list'] != null) {
//         list = json['list']
//             .map<Conimal>((json) => Conimal.fromJson(json))
//             .toList();
//       }
//       return ConimalResponse(
//         totalResults: totalDocuments,
//         results: list,
//       );
//     } catch (e) {
//       throw DataParsingException();
//     }
//   }
// }

