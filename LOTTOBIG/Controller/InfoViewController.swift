//
//  InfoViewController.swift
//  LOTTOBIG
//
//  Created by 김현서 on 2022/12/12.
//

import UIKit
import Alamofire
import SwiftyJSON


class InfoViewController : UIViewController{
    
    @IBOutlet weak var lookUpBtn: UIButton!
    
    @IBOutlet weak var drwtNo1: UILabel!
    @IBOutlet weak var drwtNo2: UILabel!
    @IBOutlet weak var drwtNo3: UILabel!
    @IBOutlet weak var drwtNo4: UILabel!
    @IBOutlet weak var drwtNo5: UILabel!
    @IBOutlet weak var drwtNo6: UILabel!
    @IBOutlet weak var bnusNo: UILabel!
    var ballLabels:[UILabel] = []

    
    override func viewDidLoad(){
        super.viewDidLoad()
        initBallDesign()
        alamofire(1045)
    }
    
    func initBallDesign(){
        ballLabels = [drwtNo1, drwtNo2, drwtNo3, drwtNo4,
        drwtNo5,drwtNo6,bnusNo]
        ballLabels.forEach{
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = $0.frame.size.height/2.0
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowOpacity = 0.1
            $0.layer.masksToBounds = false
            $0.layer.shadowRadius = 3 //반경
            $0.layer.shadowOffset = CGSize(width: 0, height: 10)
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

    
    @IBAction func lookUpButtonTapped(_ sender: UIButton) {
        //alamofire()
    }
    
    func alamofire(_ turnNum : Int) {
        // HTTP 네트워킹을 통해 전송 할 데이터
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=+\(turnNum)"
        AF.request(url).validate().responseJSON { [self] (response) in
                switch response.result {
                case .success(let obj):
                    do {
                        let dataJSON = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                        let getInstanceData = try JSONDecoder().decode(LottoBall.self,from:dataJSON)
                        self.drwtNo1.text = String(getInstanceData.drwtNo1!)
                        self.drwtNo1.layer.backgroundColor = self.connectLabelColor(num: getInstanceData.drwtNo1!).cgColor
                    } catch{
                        print(error.localizedDescription)
                    }
                   
                case .failure(let error):
                    print("\(#function): \(error)")
                }
            }
    }
    
}
