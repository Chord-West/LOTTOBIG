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
        AF.request("https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=+1", method: .get, encoding: URLEncoding.default, headers: nil).validate().responseData { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print(json)
                case .failure(let error):
                    print("\(#function): \(error)")
                }
            }
    }
    
}
