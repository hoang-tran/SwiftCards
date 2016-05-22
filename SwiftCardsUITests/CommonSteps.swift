//
//  CommonSteps.swift
//  SwiftCards
//
//  Created by Hoang Tran on 5/22/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

extension BaseUITests {
  
  func tap(label: String) {
    tester().tapViewWithAccessibilityLabel(label)
  }
  
  func should_not_see_label(label: String) {
    tester().waitForAbsenceOfViewWithAccessibilityLabel(label)
  }
  
  func should_see_label(label: String) {
    tester().waitForViewWithAccessibilityLabel(label)
  }
  
}