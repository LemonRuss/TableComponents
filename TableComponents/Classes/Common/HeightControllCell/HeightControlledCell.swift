//
//  HeightControlledCell.swift
//  tonesky
//
//  Created by Alex Lavrinenko on 12.11.16.
//  Copyright © 2016 Olimjon Kenjaev. All rights reserved.
//

import UIKit
import TableKit

open class HeightControlledCell: UITableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  
  public static var defaultHeight: CGFloat?  = 5
  
  public struct Info {
    var height: CGFloat
    var text: String?
    var customizeLabel: ((UILabel) -> Void)?
  }
  
  public static func defautStyle(title: String) -> HeightControlledCell.Info {
    return Info(height: 19.5, text: title, customizeLabel: {
      $0.textAlignment = .left
      $0.isUserInteractionEnabled = false
    })
  }
  
  public static func centerStyle(title: String) -> HeightControlledCell.Info {
    return Info(height: 30, text: title, customizeLabel: {
      $0.textAlignment = .center
    })
  }
  
  public static func tappable(title: String) -> HeightControlledCell.Info {
    return Info(height: 30, text: title, customizeLabel: {
      $0.textAlignment = .center
      $0.isUserInteractionEnabled = true
    })
  }
  
  func moreTapped() {
    TableCellAction(key: Actions.ShowMore, sender: self).invoke()
  }
  
  public struct Actions {
    static let ShowMore = "ShowMore"
  }
}

extension HeightControlledCell: ConfigurableCell {
  public func configure(with item: Info) {
    HeightControlledCell.defaultHeight = item.height
    if let text = item.text {
      titleLabel.text = text
    }
    if let customizeLabel = item.customizeLabel {
      customizeLabel(titleLabel)
      let tap = UITapGestureRecognizer(target: self, action: #selector(HeightControlledCell.moreTapped))
      titleLabel.addGestureRecognizer(tap)
    }
  }
}
