//
//  DeckFormViewController.swift
//  SwiftCards
//
//  Created by Hoang Tran on 5/22/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import UIKit

class DeckFormViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationButtons()
  }
  
  func onTapCreateButton(sender: AnyObject) {
  }
  
  func onTapCancelButton(sender: AnyObject) {
  }
  
}

extension DeckFormViewController {
  
  func setupNavigationButtons() {
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .Plain, target: self, action: #selector(DeckFormViewController.onTapCreateButton))
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: #selector(DeckFormViewController.onTapCancelButton))
  }
}
