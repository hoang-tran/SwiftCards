@testable import SwiftCards
import Quick
import RealmSwift

class BaseSpec: QuickSpec {
  var realm: Realm!

  override func spec() {
    super.spec()

    beforeEach {
      cleanDatabase()
      self.realm = try! Realm()
    }
  }

}
