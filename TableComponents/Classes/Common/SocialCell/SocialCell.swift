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

  @IBOutlet public weak var vkButton: UIButton!
  @IBOutlet public weak var fbButton: UIButton!
  
  
  public struct Actions {
    public static let vkButtonPressed = "vkButtonPressed"
    public static let fbButtonPressed = "fbButtonPressed"
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
