//
//  RandomViewController.swift
//  LOTTOBIG
//
//  Created by 김현서 on 2022/11/21.
//


import UIKit

class RandomViewController : UIViewController {
    
    @IBOutlet weak var firstBallLabel: UILabel!
    @IBOutlet weak var secondBallLabel: UILabel!
    @IBOutlet weak var thirdBallLabel: UILabel!
    @IBOutlet weak var fourthBallLabel: UILabel!
    @IBOutlet weak var fifthBallLabel: UILabel!
    @IBOutlet weak var sixthBallLabel: UILabel!
    
    var numbers:[Int] = []
    var BallLabels:[UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 6개의 공이 동일한 UI
        BallLabels  = [firstBallLabel, secondBallLabel, thirdBallLabel,
         fourthBallLabel, fifthBallLabel, sixthBallLabel]
        BallLabels.forEach{
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = $0.frame.size.height/2.0
            
        }


    }
    
    
    func getRandomNumber() -> Int{
        let random_num: Int = Int(arc4random_uniform(45)) + 1
        return random_num
    }
    
    func generateNumbers(){
        while numbers.count < 6{
            let num:Int = getRandomNumber()
            
            if numbers.contains(num){
                continue
            }else{
                numbers.append(num)
            }
        }
    }
    
    func connectLabelColor(num: Int) -> UIColor {
        
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
    
    
    @IBAction func randomButtonTapped(_ sender: UIButton) {
        print("hi")
        numbers = []
        generateNumbers()
        numbers.sort()

        for i in 0...5 {
            BallLabels[i].text = String(numbers[i])
            BallLabels[i].textColor = .white
            BallLabels[i].font = UIFont.systemFont(ofSize: 20, weight: .bold)
            BallLabels[i].layer.backgroundColor = connectLabelColor(num:numbers[i]).cgColor
            
            
        }
        
        
    }
    
    
}
