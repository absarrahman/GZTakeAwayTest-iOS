//
//  ShimmerTableViewCell.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 18/2/24.
//

import UIKit

class ShimmerTableViewCell: UITableViewCell {
    
    static let identifier = "ShimmerTableViewCell"
    
    
    @IBOutlet weak var parentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func startShimmer() {
        parentView.startAnimating()
    }
}
