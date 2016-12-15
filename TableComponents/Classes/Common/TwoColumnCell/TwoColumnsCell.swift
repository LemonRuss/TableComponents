//
//  TwoColumnsCell.swift
//
//  Created by Dmitry Ivanenko on 19.09.16.
//  Copyright © 2016 Sberbank. All rights reserved.
//

import UIKit
import TableKit
import GridKit


class TwoColumnsCell: UITableViewCell {
  
  typealias ItemType = (left: [Container], right: [Container], withSeparator: Bool)
  
  @IBOutlet weak var leftStackView: UIStackView! {
    didSet {
      leftDataManager = StackViewDataManager(stackView: leftStackView)
    }
  }
  @IBOutlet weak var rightStackView: UIStackView! {
    didSet {
      rightDataManager = StackViewDataManager(stackView: rightStackView)
    }
  }
  
  fileprivate var leftDataManager: StackViewDataManager!
  fileprivate var rightDataManager: StackViewDataManager!
  
}


// MARK: - ConfigurableCell

extension TwoColumnsCell: ConfigurableCell {
  
  func configure(with columnsInfo: ItemType) {
    update(dataManager: leftDataManager, containers: columnsInfo.left)
    update(dataManager: rightDataManager, containers: columnsInfo.right)
    
    if columnsInfo.withSeparator {
      layoutMargins = UIEdgeInsets.zero
      preservesSuperviewLayoutMargins = false
    } else {
      separatorInset = UIEdgeInsets(top: 0, left: 10000, bottom: 0, right:0)
    }
  }
  
  private func update(dataManager: StackViewDataManager, containers: [Container]) {
    dataManager.clear()
    dataManager.append(containers: containers)
  }
  
}
