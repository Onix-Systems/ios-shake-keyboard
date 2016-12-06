//
//  KeyboardViewController.swift
//  Eight Ball Keyboard
//
//  Created by Artem Chaykovsky on 12/1/16.
//  Copyright © 2016 Onix-Systems. All rights reserved.
//

import UIKit

// swiftlint:disable implicit_getter

final class CustomView: UIView {
    override var canBecomeFirstResponder: Bool {
        get { return true }
    }
}

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!

    override func updateViewConstraints() {
        super.updateViewConstraints()

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOSApplicationExtension 10.0, *) {
            self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: UIControlEvents.allTouchEvents)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.becomeFirstResponder()
    }

    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake {
            self.textDocumentProxy.insertText("42")
        }
    }
}
