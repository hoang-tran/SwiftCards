extension BaseUITests {

  func tap(label: String) {
    tester().tapViewWithAccessibilityLabel(label)
  }

  func choose(label: String) {
    tap(label)
  }

  func should_not_see_label(label: String) {
    tester().waitForAbsenceOfViewWithAccessibilityLabel(label)
  }

  func should_see_label(label: String) {
    tester().waitForViewWithAccessibilityLabel(label)
  }

}
