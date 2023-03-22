//  ViewController.swift
//  CodableDecodable
//  Created by Nalinee on 22/03/2023.

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblEmployee:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        parseDataToEmployee()
    }
    /// parse modal from json
    func parseDataToEmployee(){
        loadDataFromJson {[weak self] dataObj in
            do{
                let decoder = try JSONDecoder().decode(EmployeeData.self, from: dataObj)
                self?.setupDataOnLable(arr: decoder.data)
            }catch(let err){
                print("\(err)")
            }
        }
    }
    ///setup data on lable
    func setupDataOnLable(arr:[Employee]){
        let arrNames = arr.map({"\($0.id) - \($0.employeeName)"})
        lblEmployee.text = arrNames.joined(separator: "\n")
    }
    ///Read json from employee.json file and return with handler
    func loadDataFromJson(handler:@escaping((Data)->())){
        guard let filePath = Bundle.main.url(forResource: "employee", withExtension: "json") else{return}
        do{
            let data = try Data(contentsOf: filePath)
            handler(data)
        }catch(let err){
            print(err)
        }
    }
}
