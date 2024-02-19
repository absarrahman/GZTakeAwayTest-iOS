//
//  ShimmerTableViewCell.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 18/2/24.
//

import UIKit

class ShimmerTableViewCell: UITableViewCell {
    
    static let identifier = "ShimmerTableViewCell"
    
    @IBOutlet private weak var imgView: UIImageView!
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    
    @IBOutlet private weak var phoneLabel: UILabel!
    
    @IBOutlet private weak var parentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Since width and height are equal. Setting cornerRadius to half of height will make it circular
        imgView.layer.cornerRadius = imgView.bounds.height / 2
    }
    func startLoadingAnimation() {
        imgView.startShimmerAnimation()
        nameLabel.startShimmerAnimation()
        phoneLabel.startShimmerAnimation()
    }
}
