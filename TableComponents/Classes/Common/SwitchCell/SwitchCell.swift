//
//  CellWithSwitchTableViewCell.swift
//  tonesky
//
//  Created by Alex Lavrinenko on 02.12.16.
//  Copyright © 2016 Olimjon Kenjaev. All rights reserved.
//

import UIKit
import TableKit

class SwitchCell: UITableViewCell {

  @IBOutlet weak var titleLabel: UILabel!
  
  @IBOutlet weak var switcher: UISwitch!

  struct Actions {
    static let switchChanged = "SwitchChanged"
  }
  
  @IBAction func switcherChanged() {
    TableCellAction(key: Actions.switchChanged, sender: self).invoke()
  }
}

extension SwitchCell: ConfigurableCell {
  func configure(with info: String) {
    titleLabel.text = info
  }
}