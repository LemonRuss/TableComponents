//
//  TitleDescriptionAvatarCell.swift
//  tonesky
//
//  Created by Alex Lavrinenko on 03.12.16.
//  Copyright © 2016 Olimjon Kenjaev. All rights reserved.
//


import UIKit
import TableKit
//import SDWebImage

class TitleDescriptionAvatarCell: UITableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descripionLabel: UILabel!
  
  @IBOutlet weak var avatarImageView: UIImageView! {
    didSet {
      avatarImageView.layer.cornerRadius = (avatarImageView.frame.width / 2) * 0.8
      avatarImageView.clipsToBounds = true
    }
  }
  
  static func defaultStyle(title: String, description: String, avatar: String) -> Info {
    return Info(title: title, description: description, avatar: avatar, customizeTitleLabel: {
      $0.textColor = UIColor(hex: 0x4A4A4A)
    }, customizeDescriptionLabel: {
      $0.textColor = UIColor(hex: 0x4A4A4A)
      $0.isUserInteractionEnabled = true
    })
  }
  
  
  struct Info {
    var title: String
    var description: String
    var avatar: String
    var customizeTitleLabel: ((UILabel) -> Void)?
    var customizeDescriptionLabel: ((UILabel) -> Void)?
  }
  
  struct Actions {
    static let descriptionLabelTapped = "DescriptionLabelTapped"
  }
  
  func descriptionTapped() {
    TableCellAction(key: Actions.descriptionLabelTapped, sender: self).invoke()
  }
}

extension TitleDescriptionAvatarCell: ConfigurableCell {
  func configure(with item: Info) {
    titleLabel.text = item.title
    descripionLabel.text = item.description
    if let url = URL(string: item.avatar) {
//      avatarImageView.sd_setImage(with: url)
    }
    if let customizeTitleLabel = item.customizeTitleLabel {
      customizeTitleLabel(titleLabel)
    }
    if let customizeDescriptionLabel = item.customizeDescriptionLabel {
      customizeDescriptionLabel(descripionLabel)
      let tap = UITapGestureRecognizer(target: self, action: #selector(descriptionTapped))
      descripionLabel.addGestureRecognizer(tap)
    }
  }
}

