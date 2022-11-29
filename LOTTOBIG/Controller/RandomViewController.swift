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
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 30
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
        var colors: [UIColor]

        colors = UIColor.colorWithString("F9264E")
    }
    
    
    @IBAction func randomButtonTapped(_ sender: UIButton) {
        print("hi")
        numbers = []
        generateNumbers()
        numbers.sort()

        for i in 0...5 {
            BallLabels[i].text = String(numbers[i])
            
            
            BallLabels[i].layer.backgroundColor = connectLabelColor(num:numbers[i])
        }
        
        
    }
    
    
}
