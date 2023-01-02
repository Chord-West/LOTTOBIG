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
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    @IBAction func lookUpButtonTapped(_ sender: UIButton) {
        alamofire()
    }
    
    func alamofire() {
        // HTTP 네트워킹을 통해 전송 할 데이터
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=+1"
        AF.request(url).validate().responseJSON { (response) in
                switch response.result {
                case .success(let obj):
                    if let nsDictionary = obj as? NSDictionary {
                        if let drwtNo1 = nsDictionary["drwtNo1"] as? Int {
                            print(drwtNo1)
                        }
                    }
                    //print(json.drwtNo1)
                case .failure(let error):
                    print("\(#function): \(error)")
                }
            }
    }
    
}
