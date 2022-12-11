//
//  RandomViewController.swift
//  LOTTOBIG
//
//  Created by 김현서 on 2022/11/21.
//


import UIKit

class RandomViewController : UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var randomButton: UIButton!
    
    
    var numberData:[[Int]] = []
    var numbers:[Int] = []
    var numberOfCell = 5

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView() // tableView 초기 설정

    }
    
    private func configureTableView(){
        self.tableView.dataSource = self
        self.tableView.layer.shadowColor = UIColor.black.cgColor
        self.tableView.layer.shadowOpacity = 0.3
        self.tableView.layer.masksToBounds = false
        self.tableView.layer.shadowRadius = 5 //반경
        self.tableView.layer.shadowOffset = CGSize(width: 0, height: 10)
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
    
    
    //MARK: - 버튼 액션 메소드
    @IBAction func randomButtonTapped(_ sender: UIButton) {
        print("hi")
        numbers = []
        generateNumbers()
        numbers.sort()
        numberData.append(numbers)         // 공 저장
        print(numberData)
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        self.tableView.endUpdates()
        
        //self.tableView.reloadData()
        
        
    }
    
    
}


extension RandomViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: "ballCell", for: indexPath) as? RandomBallCell else { return UITableViewCell()}

        cell.update(numbers: numberData[indexPath.row])
        return cell
        
    }
    
    
    
    
}

