//
//  QrViewController.swift
//  LOTTOBIG
//
//  Created by 김현서 on 2022/11/14.
//



import UIKit
import WebKit


class QrViewController : UIViewController{
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string : "https://www.naver.com")
        let requestObj = URLRequest(url: url!)
        webView.load(requestObj)
        
    }
}
