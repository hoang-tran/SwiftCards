import UIKit
import RealmSwift

class DeckFormViewController: UIViewController {

  @IBOutlet weak var deckNameTextField: UITextField!
  var deck: Deck?

  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationButtons()
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    deckNameTextField.text = ""
    var text = "Create"
    if let deck = self.deck {
      deckNameTextField.text = deck.name
      text = "Rename"
    }
    self.title = "\(text) Deck"
    self.navigationItem.rightBarButtonItem?.title = text
    updateCreateButtonState()
  }

  func renameDeck(deck: Deck) {
    self.deck = deck
  }

  func createNewDeck() {
    self.deck = nil
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

  private func saveDeckToDatabase() {
    let realm = try! Realm()
    let inputName = deckNameTextField.text!
    try! realm.write {
      if let deck = self.deck {
        deck.name = inputName
      } else {
        let newDeck = Deck()
        newDeck.name = deckNameTextField.text!
        realm.add(newDeck)
      }
    }
  }

  private func updateCreateButtonState() {
    self.navigationItem.rightBarButtonItem?.enabled = deckNameTextField.text?.characters.count > 0
  }

  private func setupNavigationButtons() {
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .Plain, target: self, action: #selector(DeckFormViewController.onTapCreateButton))
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: #selector(DeckFormViewController.onTapCancelButton))
  }

}
