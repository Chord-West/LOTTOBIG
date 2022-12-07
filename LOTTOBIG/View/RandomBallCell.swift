//
//  RandomBallCell.swift
//  LOTTOBIG
//
//  Created by 김현서 on 2022/12/07.
//

import UIKit

class RandomBallCell : UITableViewCell {
    
    @IBOutlet weak var firstBall: UILabel!
    @IBOutlet weak var secondBall: UILabel!
    @IBOutlet weak var thirdBall: UILabel!
    @IBOutlet weak var fourthBall: UILabel!
    @IBOutlet weak var fifthBall: UILabel!
    @IBOutlet weak var sixthBall: UILabel!
    var BallLabels:[UILabel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        BallLabels  = [firstBall, secondBall, thirdBall,
         fourthBall, fifthBall, sixthBall]
        BallLabels.forEach{
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = $0.frame.size.height/2.0
            $0.layer.borderWidth = 1
        }
    }

    
    
}
