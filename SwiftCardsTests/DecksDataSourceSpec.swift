@testable import SwiftCards
import Quick
import Nimble
import RealmSwift

class DecksDataSourceSpec: BaseSpec {

  override func spec() {
    super.spec()
    var decksDataSource: DecksDataSource!
    var tableView: UITableView!

    beforeEach {
      decksDataSource = DecksDataSource()
      tableView = UITableView()
    }

    describe("#setTableView") {
      beforeEach {
        decksDataSource.tableView = tableView
      }

      it("sets the datasource and delegate correctly") {
        expect(decksDataSource.tableView.delegate).to(beIdenticalTo(decksDataSource))
        expect(decksDataSource.tableView.dataSource).to(beIdenticalTo(decksDataSource))
      }
    }

    describe("#tableView:numberOfRowsInSection") {
      context("there is no deck in the database") {
        it("returns 0") {
          expect(decksDataSource.tableView(tableView, numberOfRowsInSection: 0)).to(equal(0))
        }
      }

      context("there are some decks in the database") {
        beforeEach {
          self.createDecks(3)
        }

        it("returns number of decks in the database") {
          expect(decksDataSource.tableView(tableView, numberOfRowsInSection: 0)).to(equal(3))
        }
      }
    }

    describe("#hasData") {
      context("there is no deck in the database") {
        it("returns false") {
          expect(decksDataSource.hasData()).to(beFalsy())
        }
      }

      context("there is some decks in the database") {
        beforeEach {
          self.createDecks(3)
        }

        it("returns true") {
          expect(decksDataSource.hasData()).to(beTruthy())
        }
      }
    }
  }
}

extension DecksDataSourceSpec {

  func createDecks(numberOfDecks: Int) {
    try! realm.write {
      for _ in 0..<numberOfDecks {
        realm.add(Deck())
      }
    }
  }

}
