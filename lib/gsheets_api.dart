import 'package:gsheets/gsheets.dart';
import 'package:youtube2/todo.dart';

class GoogleSheetsApi {
  // create credentials
  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "mytestapp-349613",
  "private_key_id": "4371d29c490655f8ca5c62a5fc83bb24d1763ea3",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCe2o3BV/deuLd5\nbougXKDONmMZD9B1AU1HeuaVnGiBhsproxu+pX+LnpJ3eWlzw4Paa0w4XpVXUus5\nTGgLfaSNF4tZZ6BlK2r1oT+KUMG3ICHo8wU241D7uO5nf9vXi+noeGDDsZlpa4f0\nv6THJo/dx/Xl7HM6N0fBwmBxqwG3nyFou0mrgSQGIgNEG+++n5JHOqxk9CarFefz\nQUbXYKvKqv/gdUNvSqQUo653boX60VsbOdWWvuJVde5KZRViVgmCt1Vb4wI95Ev5\nBhDtTXIYvSsJ5hUVvnwiTOANBBJ6VbGrXT3vT0VXMBb5QKqI7N+O9TdyROSHrJSE\nEgJHz/XZAgMBAAECggEAQlT0uHVpAA6V3okAmNfU9gbT3pUx8Im4oU56lqKXKO8F\n+2hCn5sv5Tcz5du24vYTStNfInKsXahsPKLhF1tBqQDZ2V1iJpy4rxTEGZebLEKo\npkNEPCUznckdE+7Z9+mepMoPbeftLY4PWW3k+pvpmyxyS64ud3K57fiimRRVRTzu\n0pHw1bS+b3Ar9nc572mW6gw4lIDKdVgrA5pcenaShOI6GDyhwt1Ygn2qEvSb5PWC\nKQaxdxFC4ifo/qFWcgUdiKSL0hYKPv+EQ0rzRsRDrWrLKS1vwN/hly/2Saovd3aW\n34BG/28x4ztNa8XjVkwDZymBfiaOdfXUpd2xVK+S2QKBgQDWn5aLm4qZzZgL1FtL\nqzrT7PR5P6UBQqFL/+Dkqc5E7IUM8SoKHEJ5l80uIovN65gyKc8+hE4+MRuZNY27\n+Uf6/BbCZih0srPnPG1amIpkr9mnrs/AnsG4JmU5nNi4O8B+7JZwccBU1WywrAtE\nvFkX/bqV2bYfikNkKq52gl77kwKBgQC9eonVqHxPeMf5lQdzuY5BrUuxyFRgMQhV\nt8sGqbLVq2uTdOP3kNGKX+SVisywrF5hjXHAT0aoacacfWxgu1Ly4DAp+c8EkBfV\nxWDqZuB6YD2X3Izh4sZ8QtYRelL35IjA3E7QouaBbO27lmMmfCbgEMfmPmWaa9l1\nPWV/z/wkYwKBgQCsMPWzpGMa6pwmQYXNu99C0EWEUc+spyyJsQ1Z5/KZ0bkdnQ9B\ndVLQAz6W2RiZaX9+H5UqbzPnKbcewJyqR2G8uCv6Y8PpfMZhq1WA7gl6pqtVoScF\nP1nkyMlF49TsWuQh8Obx6BGK/oBpbl7MEuDYIrVkLHu16lQPNT8rzYUvCQKBgDNh\nBf0sucCnBLrVwXaM61k9z5e+tbp7sUHlG6WL4JV17S7H9IUN/PPjus0eHREPPGyB\neUXneUZzoEqQ7BFy2jRHvGe1eIBJPl1WL0iAawBkFm+We5FI9/979CY7IEJd8wMw\n+iIy+gRAcFp8lhg6dCQwCLSTWOO9uPLEmkBFOp73AoGBAIe1r9MO2GRSAlHaSdAN\nbv/wjaOWOVMzNnfO2s+3DrjhGKDIAW3A4cT4S4IRZvXQkZ+0QRKPsMlBoYKWo7fJ\n7NIWLh2BaobE1yA04B/JxG3hxGHEM+Cvfn485YUS8QE1U2vs8dYy3pT30qXmCBFQ\nQx16693IZnPG5cKtZZKHNSry\n-----END PRIVATE KEY-----\n",
  "client_email": "mytestapp@mytestapp-349613.iam.gserviceaccount.com",
  "client_id": "109922652119068975678",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/mytestapp%40mytestapp-349613.iam.gserviceaccount.com"
}
  ''';

  static final _spreadsheetId = '1QYmZEg26tewK8ifEyATkfqGpF01Y-7Lb4P0eJwJQ-e8';
  static final _gheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    final spreadsheet = await _gheets.spreadsheet(_spreadsheetId);
    _userSheet = await _getWorkSheet(spreadsheet, title: 'TODO');
    final firstRow = UserFields.getFields();
    _userSheet!.values.insertRow(1, firstRow);
  }

  static Future<TODO?> getById(int id) async {
    if (_userSheet == null) return null;
    final json = await _userSheet!.values.map.rowByKey(id, fromColumn: 1);
    return json == null ? null : TODO.fromJson(json);
  }

  static Future<List<TODO>?> read() async {
    List<TODO>? list = (await _userSheet?.values.map.allRows(fromRow: 1))
        ?.map((e) => TODO.fromJson(e))
        .toList();

    print(list?[0].date);
    print(list?[0].or);
    print(list?[0].task);
    return (list);
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }
}
