/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology. Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

class AddContactVC: UIViewController {
  
  // MARK: IBOutlet Connections
  @IBOutlet weak var nameLabel: UITextField!
  @IBOutlet weak var phoneLabel: UITextField!
  @IBOutlet weak var emailAddress: UITextField!
  @IBOutlet weak var imageView: CircularImageView!
  
  let keyboardOffset: CGFloat = -80
  let yOrigin: CGFloat = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //Looks for single or multiple taps.
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
    view.addGestureRecognizer(tap)
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
  }
  
  //Calls this function when the tap is recognized.
  func dismissKeyboard() {
    
    view.endEditing(true)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func addContact() {
    
    guard let name = nameLabel.text,
      let phone = phoneLabel.text,
      let email = emailAddress.text else { return }
    
    DataSource.shared.contactArray.append(Contact(name: name, email: email, phone: phone))
    print(DataSource.shared.contactArray)
    
  }
  
  func keyboardWillShow() {
    
    // Moves the view up to show all text fields
    self.view.frame.origin.y = keyboardOffset
  }
  
  func keyboardWillHide() {
    
    // Returns the view to its original position when editing is complete
    self.view.frame.origin.y = yOrigin
    
  }
  
  @IBAction func createContactTapped() {
    
    addContact()
    navigationController?.popToRootViewController(animated: true)
  }
}

