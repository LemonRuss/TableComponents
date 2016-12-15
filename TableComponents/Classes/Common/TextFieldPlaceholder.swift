//
//  TextFieldPlaceholder.swift
//  tonesky
//
//  Created by Alex Lavrinenko on 14.11.16.
//  Copyright © 2016 Olimjon Kenjaev. All rights reserved.
//

import UIKit

class TextFieldPlaceholder: UITextField {
  
  var placeholderColor: UIColor? {
    didSet {
      guard let placeholderColor = placeholderColor else {
        return
      }
      attributedPlaceholder = NSAttributedString(string: placeholderTitle ?? "",
                                                 attributes:[NSForegroundColorAttributeName: placeholderColor])
    }
  }
  
  var placeholderTitle: String? {
    didSet {
      guard let placeholderColor = placeholderColor else {
        return
      }
      attributedPlaceholder = NSAttributedString(string: placeholderTitle ?? "",
                                                 attributes:[NSForegroundColorAttributeName: placeholderColor])
    }
  }
}
