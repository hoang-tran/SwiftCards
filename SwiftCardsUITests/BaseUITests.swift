//
//  BaseUITests.swift
//  SwiftCards
//
//  Created by Hoang Tran on 5/22/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import KIF
import RealmSwift

class BaseUITests: KIFTestCase {
  
  override func beforeEach() {
    super.beforeEach()
    cleanDatabase()
  }

}

extension BaseUITests {

  func cleanDatabase() {
    let realm = try! Realm()
    try! realm.write {
      realm.deleteAll()
    }
  }
  
}