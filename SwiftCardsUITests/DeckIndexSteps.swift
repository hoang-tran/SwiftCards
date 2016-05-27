//
//  DeckIndexSteps.swift
//  SwiftCards
//
//  Created by Hoang Tran on 5/22/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import Nimble

extension DeckIndexTests {

  func fill_in_deck_name() {
    tester().clearTextFromAndThenEnterText(deckName, intoViewWithAccessibilityLabel: "Deck Name TextField")
  }

  func should_see_the_new_deck_added_into_the_list_successfully() {
    should_not_see_label("No Decks found")
    tester().waitForViewWithAccessibilityLabel(deckName)
  }

  func should_see_the_create_button_enabled_only_when_deck_name_is_entered() {
    let createButton = tester().waitForViewWithAccessibilityLabel("Create") as! UIButton
    expect(createButton.enabled).to(beFalse())
    tester().clearTextFromAndThenEnterText(deckName, intoViewWithAccessibilityLabel: "Deck Name TextField")
    expect(createButton.enabled).to(beTrue())
    tester().clearTextFromViewWithAccessibilityLabel("Deck Name TextField")
    expect(createButton.enabled).to(beFalse())
  }

  func should_not_see_any_decks_listed() {
    tester().waitForAbsenceOfViewWithAccessibilityLabel("DecksTableView")
  }

  func deck_form_should_show_up() {
    tester().waitForViewWithAccessibilityLabel("Create Deck")
    let textField = tester().waitForViewWithAccessibilityLabel("Deck Name TextField") as! UITextField
    expect(textField.text?.characters.count) == 0
    tester().waitForViewWithAccessibilityLabel("Create")
    tester().waitForViewWithAccessibilityLabel("Cancel")
  }

  func deck_form_should_disappear() {
    tester().waitForAbsenceOfViewWithAccessibilityLabel("Create Deck")
    tester().waitForAbsenceOfViewWithAccessibilityLabel("Deck Name TextField")
    tester().waitForAbsenceOfViewWithAccessibilityLabel("Create")
  }

  func tap_action_button_on_first_deck() {
    tester().tapViewWithAccessibilityLabel("Deck #1 - Action Button")
  }

  func deck_rename_form_should_show_up() {
    tester().waitForViewWithAccessibilityLabel("Rename Deck")
    tester().waitForViewWithAccessibilityLabel("Deck Name TextField")
    tester().waitForViewWithAccessibilityLabel("Rename")
    tester().waitForViewWithAccessibilityLabel("Cancel")
  }

  func deck_rename_form_should_disappear() {
    tester().waitForAbsenceOfViewWithAccessibilityLabel("Rename Deck")
    tester().waitForAbsenceOfViewWithAccessibilityLabel("Deck Name TextField")
    tester().waitForAbsenceOfViewWithAccessibilityLabel("Rename")
    tester().waitForAbsenceOfViewWithAccessibilityLabel("Cancel")
  }

  func should_see_the_deck_name_prefilled() {
    let textField = tester().waitForViewWithAccessibilityLabel("Deck Name TextField") as! UITextField
    expect(textField.text).to(equal(deckName))
  }

  func change_to_different_name() {
    tester().clearTextFromAndThenEnterText(otherName, intoViewWithAccessibilityLabel: "Deck Name TextField")
  }

  func should_see_the_deck_name_updated_successfully() {
    tester().waitForAbsenceOfViewWithAccessibilityLabel(deckName)
    tester().waitForViewWithAccessibilityLabel(otherName)
  }

}
