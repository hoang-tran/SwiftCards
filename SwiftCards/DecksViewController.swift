//
//  DecksViewController.swift
//  SwiftCards
//
//  Created by Hoang Tran on 5/22/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import UIKit
import RealmSwift

class DecksViewController: UIViewController {

  @IBOutlet weak var emptyDeckLabel: UILabel!
  @IBOutlet weak var decksTableView: UITableView!

  let dataSource = DecksDataSource()
  var decks: Results<Deck>?

  override func viewDidLoad() {
    super.viewDidLoad()
    dataSource.tableView = decksTableView
    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(DecksViewController.onTapCreateButtonOnDeckForm), name: "DeckFormTapCreateButton", object: nil)
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    displayDecksIfAny()
  }

  lazy var deckFormNavigationViewController : UINavigationController = {
    return UIStoryboard.deckFormNavigationViewController()
  }()

  @IBAction func onTapNewDeckButton(sender: AnyObject) {
    navigationController?.presentViewController(deckFormNavigationViewController, animated: true, completion: nil)
  }

  func onTapCreateButtonOnDeckForm(notification: NSNotification) {
    dataSource.reloadData()
  }

}

extension DecksViewController {

  func displayDecksIfAny() {
    emptyDeckLabel.hidden = dataSource.hasData()
    decksTableView.hidden = !emptyDeckLabel.hidden
  }

}
