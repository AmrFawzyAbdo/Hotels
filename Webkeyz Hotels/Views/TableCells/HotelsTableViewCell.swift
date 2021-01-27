//
//  HotelsTableViewCell.swift
//  Webkeyz Hotels
//
//  Created by Amr Fawzy on 1/26/21.
//

import UIKit

class HotelsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var hotelImage: UIImageView!
    @IBOutlet weak var hotelName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        hotelImage.roundCorners(with: [.layerMinXMinYCorner, .layerMaxXMinYCorner , .layerMinXMaxYCorner , .layerMaxXMaxYCorner], radius: 20)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension UIImageView {
    func roundCorners(with CACornerMask: CACornerMask, radius: CGFloat) {
              self.layer.cornerRadius = radius
              self.layer.maskedCorners = [CACornerMask]
        }
}
