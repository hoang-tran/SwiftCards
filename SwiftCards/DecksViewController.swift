//
//  DecksViewController.swift
//  SwiftCards
//
//  Created by Hoang Tran on 5/22/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import UIKit

class DecksViewController: UIViewController {
  
  lazy var deckFormNavigationViewController : UINavigationController = {
    return UIStoryboard.deckFormNavigationViewController()
  }()
  

  @IBAction func onTapNewDeckButton(sender: AnyObject) {
    navigationController?.presentViewController(deckFormNavigationViewController, animated: true, completion: nil)
  }
  
}
