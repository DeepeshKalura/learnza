abstract class Authentication {}

abstract class Storage {}

abstract class Database {}

abstract class BaaSService {
  Authentication getAuth();
  Storage getStorage();
  Database getDatabase();
}
