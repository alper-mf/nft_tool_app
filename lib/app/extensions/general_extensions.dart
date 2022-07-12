import 'package:nft_tool_app/app/model/enums/general_enums.dart';

/// [BaseModelStatus] Enumun durumlarını kontrol etmek için yazıldı
extension BaseModelStatusExtension on BaseModelStatus {
  get isOk => this == BaseModelStatus.ok;

  get isAction => this == BaseModelStatus.action;

  get isError => this == BaseModelStatus.error;

  get isUnprocessableEntity => this == BaseModelStatus.unprocessableEntity;

  get isTimeOut => this == BaseModelStatus.timeOut;

  get isNotFound => this == BaseModelStatus.notFound;
}
