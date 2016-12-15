//
//  TableRowAction.swift
//  EFS
//
//  Created by Dmitry Ivanenko on 26.09.16.
//  Copyright © 2016 Sberbank. All rights reserved.
//

import TableKit


extension TableRowAction {
  
  public static func disableSelectionAction() -> TableRowAction<CellType> {
    return TableRowAction<CellType>(.configure) {
      data in
      data.cell?.selectionStyle = .none
    }
  }
  
  public static func arrowConfigureAction() -> TableRowAction<CellType> {
    return TableRowAction<CellType>(.configure) {
      data in
      data.cell!.accessoryType = .disclosureIndicator

      data.cell!.contentView.snp.makeConstraints { (make) in
        make.right.equalTo(data.cell!).offset(-10)
        make.left.top.bottom.equalTo(0)
      }
    }
  }
  
  public static func hideArrowAction() -> TableRowAction<CellType> {
    return TableRowAction<CellType>(.configure) {
      data in
      data.cell!.accessoryType = .none
    }
  }
  
  public static func hideSeparatorAction() -> TableRowAction<CellType> {
    return TableRowAction<CellType>(.configure) {
      data in
      data.cell?.separatorInset = UIEdgeInsets(top: 0, left: 10000, bottom: 0, right:0)
    }
  }
  
  public static func fullLineSeparatorAction() -> TableRowAction<CellType> {
    return TableRowAction<CellType>(.configure) {
      data in
      data.cell?.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right:0)
    }
  }
  
}
