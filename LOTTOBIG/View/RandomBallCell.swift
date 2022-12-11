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
    
    func update(numbers : [Int]){
        BallLabels = [firstBall, secondBall, thirdBall,
        fourthBall, fifthBall, sixthBall]
        
        BallLabels.forEach{
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = $0.frame.size.height/2.0
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowOpacity = 0.1
            $0.layer.masksToBounds = false
            $0.layer.shadowRadius = 3 //반경
            $0.layer.shadowOffset = CGSize(width: 0, height: 10)
        }
        
        print("numbers \(numbers)")
        for i in 0...5 {
            
            BallLabels[i].text = String(numbers[i])
            BallLabels[i].textColor = .white
            BallLabels[i].font = UIFont.systemFont(ofSize: 20, weight: .bold)
            BallLabels[i].layer.backgroundColor = connectLabelColor(num:numbers[i]).cgColor
        }
        
    }
    
    func connectLabelColor(num: Int) -> UIColor {
        
        //  공별로 색깔 연결
        switch num {
        case 1...10:
            return UIColor(red: 255/255, green: 200/255, blue: 0/255, alpha: 1.0)
        case 11...20:
            return UIColor(red: 100/255, green: 200/255, blue: 245/255, alpha: 1.0)
        case 21...30:
            return UIColor(red: 255/255, green: 110/255, blue: 110/255, alpha: 1.0)
        case 31...40:
            return UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1.0)
        case ...45:
            return UIColor(red: 167/255, green: 230/255, blue: 56/255, alpha: 1.0)
        default:
            return UIColor.yellow
        }
    
    }
    
    // cell 배경 초기 설정
    required init?(coder: NSCoder){
        super.init(coder: coder)
        //self.contentView.layer.cornerRadius = 3.0
        //self.contentView.layer.borderWidth = 1.0
        //self.contentView.layer.borderColor = UIColor.black.cgColor

        
    }
    

    
    
}
