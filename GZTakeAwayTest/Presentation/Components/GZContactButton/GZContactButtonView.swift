//
//  GZContactButton.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 19/2/24.
//

import UIKit

@IBDesignable
class GZContactButtonView: UIView {
    
    @IBOutlet private weak var view: UIView!
    
    
    @IBOutlet weak var buttonLabel: UILabel!
    
    
    @IBOutlet weak var buttonImageView: UIImageView!
    
    @IBInspectable var buttonImage: UIImage = UIImage(systemName: "person")!
    @IBInspectable var buttonText: String = ""
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 100, height: 36)
    }
    
    fileprivate func setupNib() {
        let bundle = Bundle(for: SearchFieldView.self)
        bundle.loadNibNamed("GZContactButtonView", owner: self)
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
        view.layer.cornerRadius = 8
        buttonImageView.image = buttonImage
        buttonLabel.text = buttonText
    }

}
