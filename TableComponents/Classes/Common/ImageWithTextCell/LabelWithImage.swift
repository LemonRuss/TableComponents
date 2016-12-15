//
//  LabelWithImage.swift
//  EFS
//
//  Created by Dmitry Ivanenko on 19.09.16.
//  Copyright © 2016 Sberbank. All rights reserved.
//

import UIKit
import GridKit


class LabelWithImage: LoadableFromXibView {
  
  struct Info {
    var title: String
    var image: UIImage?
  }
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  
  static var defaultHeight: CGFloat?  = 30
  
}


// MARK: - Configurable

extension LabelWithImage: Configurable {
  
  func configure(with item: LabelWithImage.Info) {
    titleLabel.text = item.title
    imageView.image = item.image
    
  }
}
