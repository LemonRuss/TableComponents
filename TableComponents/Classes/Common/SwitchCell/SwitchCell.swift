//
//  CellWithSwitchTableViewCell.swift
//  tonesky
//
//  Created by Alex Lavrinenko on 02.12.16.
//  Copyright © 2016 Olimjon Kenjaev. All rights reserved.
//

import UIKit
import TableKit

open class SwitchCell: UITableViewCell {

  @IBOutlet public weak var titleLabel: UILabel!
  
  @IBOutlet public weak var switcher: UISwitch!

  public struct Actions {
    public static let switchChanged = "SwitchChanged"
  }
  
  @IBAction func switcherChanged() {
    TableCellAction(key: Actions.switchChanged, sender: self).invoke()
  }
}

extension SwitchCell: ConfigurableCell {
  public func configure(with info: String) {
    titleLabel.text = info
  }
}
