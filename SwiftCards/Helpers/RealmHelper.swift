//
//  RealmHelper.swift
//  SwiftCards
//
//  Created by Hoang Tran on 5/26/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import RealmSwift

func setupDatabaseForTest() {
  if NSProcessInfo.processInfo().environment["XCTestConfigurationFilePath"] != nil {
    initializeTestingDatabase()
    cleanDatabase()
  }
}

func initializeTestingDatabase() {
  var config = Realm.Configuration()
  config.fileURL = config.fileURL!.URLByDeletingLastPathComponent?
    .URLByAppendingPathComponent("test_realm.realm")
  print("database url = \(config.fileURL?.absoluteString)")
  Realm.Configuration.defaultConfiguration = config
}

func cleanDatabase() {
  let realm = try! Realm()
  try! realm.write {
    realm.deleteAll()
  }
}
