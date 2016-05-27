class DeckIndexTests: BaseUITests {

  let deckName = "Deck #1"
  let otherName = "Other name"

  func test01_no_decks_found() {
    should_see_label("No Decks found")
    should_not_see_any_decks_listed()
  }

  func test02_tap_cancel_on_deck_form() {
    tap("New Deck")
    deck_form_should_show_up()
    tap("Cancel")
    deck_form_should_disappear()
  }

  func test03_add_one_new_deck_to_list() {
    tap("New Deck")
    should_see_the_create_button_enabled_only_when_deck_name_is_entered()
    fill_in_deck_name()
    tap("Create")
    deck_form_should_disappear()
    should_see_the_new_deck_added_into_the_list_successfully()
  }

  func test04_rename_a_deck() {
    tap_action_button_on_first_deck()
    choose("Rename")
    deck_rename_form_should_show_up()
    should_see_the_deck_name_prefilled()
    change_to_different_name()
    tap("Rename")
    deck_rename_form_should_disappear()
    should_see_the_deck_name_updated_successfully()
  }

}
