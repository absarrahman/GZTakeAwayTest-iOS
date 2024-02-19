//
//  SearchFieldView.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 18/2/24.
//

import UIKit

@IBDesignable
class SearchFieldView: UIView {
    
    @IBOutlet private weak var view: UIView!
    
    
    @IBOutlet weak var textfield: UITextField!
    
    
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 200, height: 36)
    }
    
    fileprivate func setupNib() {
        let bundle = Bundle(for: SearchFieldView.self)
        bundle.loadNibNamed("SearchFieldView", owner: self)
        addSubview(view)
        view.frame = self.bounds
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        view.layer.cornerRadius = 16
    }
}
