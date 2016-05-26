//
//  DecksDataSource.swift
//  SwiftCards
//
//  Created by Hoang Tran on 5/22/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class DecksDataSource: NSObject {

  var tableView: UITableView! {
    didSet {
      tableView.dataSource = self
      tableView.delegate = self
      tableView.registerNib(UINib(nibName: "DeckCell", bundle: nil), forCellReuseIdentifier: DeckCellReuseIdentifier)
    }
  }

  lazy var decks: Results<Deck> = {
    let realm = try! Realm()
    return realm.objects(Deck)
  }()

  func hasData() -> Bool {
    return decks.count > 0
  }

  func reloadData() {
    tableView.reloadData()
  }

}

extension DecksDataSource: UITableViewDataSource {

  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  func tableView(tableView: UITableView, numberOfRowsInSection: Int) -> Int {
    return decks.count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(DeckCellReuseIdentifier, forIndexPath: indexPath) as! DeckCell
    cell.deck = decks[indexPath.row]
    return cell
  }

}

extension DecksDataSource: UITableViewDelegate {

}
