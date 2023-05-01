class UserClass {
  late String _userId;
  late String _password;
  late String _appId;

  UserClass() {}

  UserClass.takeInput(
      {required String userId,
      required String userPwd,
      required String userAppId}) {
    this._userId = userId;
    this._password = userPwd;
    this._appId = userAppId;
  }

  get userId => this._userId;

  set userId(value) => this._userId = value;

  get password => this._password;

  set password(value) => this._password = value;

  get appId => this._appId;

  set appId(value) => this._appId = value;
}