//
//  DeckCell.swift
//  SwiftCards
//
//  Created by Hoang Tran on 5/26/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import UIKit

let DeckCellReuseIdentifier = "DeckCell"

class DeckCell: UITableViewCell {

  @IBOutlet weak var nameLabel: UILabel!
  var deck: Deck! {
    didSet {
      nameLabel.text = deck.name
      nameLabel.accessibilityLabel = deck.name
    }
  }

}
