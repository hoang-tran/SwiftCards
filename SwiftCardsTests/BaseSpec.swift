//
//  BaseSpec.swift
//  SwiftCards
//
//  Created by Hoang Tran on 5/26/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

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
