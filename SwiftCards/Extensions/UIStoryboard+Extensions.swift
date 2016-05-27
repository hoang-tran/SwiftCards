import UIKit

extension UIStoryboard {

  class func main() -> UIStoryboard {
    return UIStoryboard(name: "Main", bundle: nil)
  }

  class func deckFormNavigationViewController() -> UINavigationController {
    return UIStoryboard.main().instantiateViewControllerWithIdentifier("DeckFormNavigationViewController") as! UINavigationController
  }

}
