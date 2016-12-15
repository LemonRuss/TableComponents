//
//  LoadableFromXibView.swift
//  EFS
//
//  Created by Dmitry Ivanenko on 19.09.16.
//  Copyright © 2016 Sberbank. All rights reserved.
//

import UIKit
import SnapKit


open class LoadableFromXibView: UIView {
  
  @IBOutlet weak var view: UIView!
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    xibSetup()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    xibSetup()
  }
  
  func xibSetup() {
    view = loadViewFromXib()
    addSubview(view)
    view.snp.makeConstraints {
      (make) -> Void in
      make.left.equalTo(self)
      make.top.equalTo(self)
      make.right.equalTo(self)
      make.bottom.equalTo(self)
    }
  }
  
  private func loadViewFromXib() -> UIView {
    let nib = UINib(nibName: String(describing: type(of: self)), bundle: nil)
    let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
    return view
  }
  
}
