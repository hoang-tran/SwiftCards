//
//  DeckFormViewController.swift
//  SwiftCards
//
//  Created by Hoang Tran on 5/22/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import UIKit
import RealmSwift

class DeckFormViewController: UIViewController {

  @IBOutlet weak var deckNameTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationButtons()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    deckNameTextField.text = ""
    updateCreateButtonState()
  }
  
  func onTapCreateButton(sender: AnyObject) {
    dismissViewControllerAnimated(true, completion: nil)
    saveDeckToDatabase()
    NSNotificationCenter.defaultCenter().postNotificationName("DeckFormTapCreateButton", object: nil)
  }
  
  func onTapCancelButton(sender: AnyObject) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  @IBAction func onDeckNameChanged(sender: AnyObject) {
    updateCreateButtonState()
  }
}

extension DeckFormViewController {
  
  func saveDeckToDatabase() {
    let newDeck = Deck()
    newDeck.name = deckNameTextField.text!
    let realm = try! Realm()
    try! realm.write {
      realm.add(newDeck)
    }
  }
  
  func updateCreateButtonState() {
    self.navigationItem.rightBarButtonItem?.enabled = deckNameTextField.text?.characters.count > 0
  }
  
  func setupNavigationButtons() {
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .Plain, target: self, action: #selector(DeckFormViewController.onTapCreateButton))
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: #selector(DeckFormViewController.onTapCancelButton))
  }
  
}
