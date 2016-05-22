//
//  DeckIndexTests.swift
//  SwiftCards
//
//  Created by Hoang Tran on 5/22/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import KIF
import Quick
import Nimble

class DeckIndexTests: KIFTestCase {
  
  override func setUp() {
    super.setUp()
    cleanDatabase()
  }
  
  func testNoDecksFound() {
    tester().waitForViewWithAccessibilityLabel("No Decks found")
    tester().waitForAbsenceOfViewWithAccessibilityLabel("DecksTableView")
  }
  
  func testPressAddButtonShouldOpenDeckForm() {
    tester().tapViewWithAccessibilityLabel("New Deck")
    expectToSeeDeckForm()
  }
  
}

extension DeckIndexTests {
  
  func cleanDatabase() {
    
  }
  
  func expectToSeeDeckForm() {
    tester().waitForViewWithAccessibilityLabel("Create Deck")
    tester().waitForViewWithAccessibilityLabel("Deck Name TextField")
    tester().waitForViewWithAccessibilityLabel("Create")
    tester().waitForViewWithAccessibilityLabel("Cancel")
  }
  
}
