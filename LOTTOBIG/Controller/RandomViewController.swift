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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 6개의 공이 동일한 UI

        [firstBallLabel, secondBallLabel, thirdBallLabel,
         fourthBallLabel, fifthBallLabel, sixthBallLabel].forEach{
            $0?.layer.borderWidth = 1
            $0?.layer.cornerRadius = CGRect($0?.frame)/2
        }

    }
    
    
    @IBAction func randomButtonTapped(_ sender: UIButton) {
        print("hi")
        
    }
    
    
}
