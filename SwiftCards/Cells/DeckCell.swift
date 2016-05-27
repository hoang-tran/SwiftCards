import UIKit

let DeckCellReuseIdentifier = "DeckCell"

protocol DeckCellDelegate {
  func deckCell(deckCell: DeckCell, onTapActionButtonOnDeck deck: Deck)
}

class DeckCell: UITableViewCell {

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var actionButton: UIButton!
  var delegate: DeckCellDelegate?

  var deck: Deck! {
    didSet {
      nameLabel.text = deck.name
      nameLabel.accessibilityLabel = deck.name
      actionButton.accessibilityLabel = "\(deck.name) - Action Button"
    }
  }

  @IBAction func onTapActionButton(sender: AnyObject) {
    delegate?.deckCell(self, onTapActionButtonOnDeck: self.deck)
  }

}
