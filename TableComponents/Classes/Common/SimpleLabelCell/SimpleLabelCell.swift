//
//  SimpleLabelCell.swift
//  tonesky
//
//  Created by Alex Lavrinenko on 14.11.16.
//  Copyright © 2016 Olimjon Kenjaev. All rights reserved.
//

import UIKit
import TableKit

class SimpleLabelCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel! {
    didSet {
      titleLabel.isUserInteractionEnabled = true
      let tap = UITapGestureRecognizer(target: self, action: #selector(labelPressed))
      titleLabel.addGestureRecognizer(tap)
    }
  }
  
  static var defaultHeight: CGFloat? = 50
  
  struct Info {
    var text: String
  }
  
  struct Actions {
    static let labelPressed = "LabelPressed"
  }
  
  func labelPressed() {
    TableCellAction(key: Actions.labelPressed, sender: self).invoke()
  }
}

extension SimpleLabelCell: ConfigurableCell {
  func configure(with item: String) {
    separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right:0)
    titleLabel.text = item
  }
}
