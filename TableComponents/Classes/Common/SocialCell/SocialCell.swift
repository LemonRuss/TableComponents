//
//  SocialCell.swift
//  tonesky
//
//  Created by Alex Lavrinenko on 14.11.16.
//  Copyright © 2016 Olimjon Kenjaev. All rights reserved.
//

import UIKit
import TableKit

open class SocialCell: UITableViewCell {

  @IBOutlet weak var vkButton: UIButton!
  @IBOutlet weak var fbButton: UIButton!
  
  
  public struct Actions {
    static let vkButtonPressed = "vkButtonPressed"
    static let fbButtonPressed = "fbButtonPressed"
  }
  
  @IBAction func vkButtonPressed(_ sender: AnyObject) {
    TableCellAction(key: Actions.vkButtonPressed, sender: self).invoke()
  }
  
  @IBAction func fbButtonPressed(_ sender: AnyObject) {
    TableCellAction(key: Actions.fbButtonPressed, sender: self).invoke()
  }
}

extension SocialCell: ConfigurableCell {
  public func configure(with item: String) {
    
  }
}
