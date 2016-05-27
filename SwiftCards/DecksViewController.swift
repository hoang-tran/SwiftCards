import UIKit
import RealmSwift

class DecksViewController: UIViewController {

  @IBOutlet weak var emptyDeckLabel: UILabel!
  @IBOutlet weak var decksTableView: UITableView!

  let dataSource = DecksDataSource()
  var decks: Results<Deck>?

  override func viewDidLoad() {
    super.viewDidLoad()
    dataSource.tableView = decksTableView
    dataSource.deckCellDelegate = self
    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(DecksViewController.onTapCreateButtonOnDeckForm), name: "DeckFormTapCreateButton", object: nil)
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    displayDecksIfAny()
  }

  lazy var deckFormNavigationViewController : UINavigationController = {
    let viewController = UIStoryboard.deckFormNavigationViewController()
    let _ = viewController.view
    return  viewController
  }()

  var deckFormViewController: DeckFormViewController {
    get {
      return deckFormNavigationViewController.topViewController as! DeckFormViewController
    }
  }

  @IBAction func onTapNewDeckButton(sender: AnyObject) {
    deckFormViewController.createNewDeck()
    navigationController?.presentViewController(deckFormNavigationViewController, animated: true, completion: nil)
  }

  func onTapCreateButtonOnDeckForm(notification: NSNotification) {
    dataSource.reloadData()
  }

}

extension DecksViewController {

  func displayDecksIfAny() {
    emptyDeckLabel.hidden = dataSource.hasData()
    decksTableView.hidden = !emptyDeckLabel.hidden
  }

}

extension DecksViewController: DeckCellDelegate {

  func deckCell(deckCell: DeckCell, onTapActionButtonOnDeck deck: Deck) {
    let alertView = UIAlertController(title: deck.name, message: "", preferredStyle: .ActionSheet)
    let onClickRename: (UIAlertAction) -> Void = { (alertAction) -> Void in
      self.deckFormViewController.renameDeck(deck)
      self.navigationController?.presentViewController(self.deckFormNavigationViewController, animated: true, completion: nil)
    }
    alertView.addAction(UIAlertAction(title: "Rename", style: .Default, handler: onClickRename))
    alertView.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
    presentViewController(alertView, animated: true, completion: nil)
  }

}
