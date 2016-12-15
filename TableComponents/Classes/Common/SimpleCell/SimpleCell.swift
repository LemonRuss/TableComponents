//
//  SimpleCell.swift
//  tonesky
//
//  Created by Alex Lavrinenko on 14.11.16.
//  Copyright © 2016 Olimjon Kenjaev. All rights reserved.
//

import UIKit
import TableKit

open class SimpleCell: UITableViewCell {
  @IBOutlet public weak var textView: TextFieldPlaceholder!
  
  public static var defaultHeight: CGFloat? = 50
  
  public static func defaultStyle(text: String) -> Info {
    return Info(text: text, hide: false)
  }
  
  public static func secureStyle(text: String) -> Info {
    return Info(text: text, hide: true)
  }
  
  public struct Info {
    var text: String
    var hide = false
  }
  
  public struct Actions {
    public static let valueDidChanged = "ValueDidChanged"
    public static let didEndEditing = "DidEndEditing"
  }
}

extension SimpleCell: ConfigurableCell {
  public func configure(with item: Info) {
    separatorInset = UIEdgeInsets(top: 0, left: 39, bottom: 0, right:0)
    textView.placeholderColor = UIColor(hex: 0x4A4A4A)
    textView.placeholderTitle = item.text
    textView.delegate = self
    if item.hide {
      textView.isSecureTextEntry = true
    }
  }
}

extension SimpleCell: UITextFieldDelegate {
  
  public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    TableCellAction(key: Actions.didEndEditing, sender: self).invoke()
    return true
  }
  public func textFieldDidEndEditing(_ textField: UITextField) {
    TableCellAction(key: Actions.didEndEditing, sender: self).invoke()
  }
}
