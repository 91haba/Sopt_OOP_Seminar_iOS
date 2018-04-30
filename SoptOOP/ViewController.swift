//
//  ViewController.swift
//  SoptOOP
//
//  Created by 이영준 on 2018. 4. 27..
//  Copyright © 2018년 이영준. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var list : [String] = []
    // tableViewOutlet
    @IBOutlet weak var tableview: UITableView!
    // btn Action
    @IBAction func btnMain(_ sender: Any) {
        // self는 객체 자체를 가르킴, 이 경우 ViewController
        // tableview에 delegate 멤벼변수는 자료형이 UITableViewDelegate임.
        // self(ViewController)가 UITableViewDelegate를 구현했음으로
        // self는 UITableViewDelegate로 캐스팅이가능함
        // 즉, 하단의 경우
        // tableview.delegate = self as! UITableViewDelegate로 암시적 업캐스팅되서 전달됨
        tableview.delegate = self
        
        
        // datasource의 자료형은 UITableViewDataSource로, self는 self as! UITableViewDataSource로 암시적 업캐스팅되서 전달
        tableview.dataSource = self
        tableview.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...100 {
            list.append("\(i)")
        }
        
    }
    
   
}

// Delegate -> 테이블뷰의 기능에 관한것
// 테이블뷰가 만들어졌는지등등..
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

// Datasource -> Model (데이터의 관한것)
// 셀은 몇개를 만들지, 어떤 셀을 노출할지 등등.
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "tableViewCell") as! MyTableViewCell
        cell.title.text = "\(list[indexPath.row])"
        return cell
    }
}

