//
//  SimpleLabelCell.swift
//  tonesky
//
//  Created by Alex Lavrinenko on 14.11.16.
//  Copyright © 2016 Olimjon Kenjaev. All rights reserved.
//

import UIKit
import TableKit

open class SimpleLabelCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel! {
    didSet {
      titleLabel.isUserInteractionEnabled = true
      let tap = UITapGestureRecognizer(target: self, action: #selector(labelPressed))
      titleLabel.addGestureRecognizer(tap)
    }
  }
  
  public static var defaultHeight: CGFloat? = 50
  
  public struct Info {
    var text: String
  }
  
  public struct Actions {
    public static let labelPressed = "LabelPressed"
  }
  
  func labelPressed() {
    TableCellAction(key: Actions.labelPressed, sender: self).invoke()
  }
}

extension SimpleLabelCell: ConfigurableCell {
  public func configure(with item: String) {
    separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right:0)
    titleLabel.text = item
  }
}
