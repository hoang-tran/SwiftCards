//
//  UIStoryboard+Extensions.swift
//  SwiftCards
//
//  Created by Hoang Tran on 5/22/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import UIKit

extension UIStoryboard {
  
  class func main() -> UIStoryboard {
    return UIStoryboard(name: "Main", bundle: nil)
  }
  
  class func deckFormNavigationViewController() -> UINavigationController {
    return UIStoryboard.main().instantiateViewControllerWithIdentifier("DeckFormNavigationViewController") as! UINavigationController
  }
  
}