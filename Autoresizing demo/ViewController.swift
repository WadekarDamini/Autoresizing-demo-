//
//  ViewController.swift
//  Autoresizing demo
//
//  Created by Shubham Shinde on 23/03/22.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var testButton: UIButton!
    @IBOutlet weak var label1: UILabel!
    var findCar = [carTypes]()
    var bounds = UIScreen.main.bounds
    
    @IBOutlet weak var carsTabelView: UITableView!
    //    var dictProjectionSchedule = [String : [Json4Swift_Base]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //        let width = bounds.size.width
        //        let height = bounds.size.height
        //        print(width, height)
        //
        //        if height == 844 {
        //            label1.font = label1.font.withSize(50)
        //        }
        
//        sizeClass(label: label1)
        
        myLabel.adjustsFontSizeToFitWidth = true
    
//        myLabel.minimumScaleFactor = 0.5
        
        print("Label Font Size  : ",myLabel.font.pointSize)
        
        testButton.setTitle("Shubham Shinde", for: .normal)
        testButton.setImage(UIImage(named: "Bullet"), for: .normal)
        testButton.semanticContentAttribute = .forceRightToLeft
        
        testButton.titleLabel?.adjustsFontSizeToFitWidth = true
        testButton.titleLabel?.lineBreakMode = .byWordWrapping
        testButton.titleLabel?.minimumScaleFactor = 0.25

        
        loadJson()
    }
    
    func sizeClass(label: UILabel) {
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        
        switch height {
        case 812:
            label.font = label.font.withSize(50); break;
        case 667:
            label.font = label.font.withSize(40); break;
        case 844:
            label.font = label.font.withSize(30); break;
        case 926:
            label.font = label.font.withSize(20); break;
        case 896:
            label.font = label.font.withSize(10); break;
        case 736:
            label.font = label.font.withSize(15); break;
        case 568:
            label.font = label.font.withSize(25); break;
        default:
            print("undefine height")
        }
    }
    
    @IBAction func testButtonAction(_ sender: Any) {
    }
    private func loadJson() {
        guard let path = Bundle.main.path(forResource: "data", ofType: ".json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        var result: carTypes?
        do {
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(carTypes.self, from: jsonData)
            
            if let result = result {
//                print("get result:",result)
                findCar.append(result)
                print("Array:",findCar)
            } else {
                print("Failed to parse")
            }
        } catch {
            print("get error:", error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return findCar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = carsTabelView.dequeueReusableCell(withIdentifier: "cell") as! CarTypeTableViewCell
    cell.carTypeLabel.text = findCar[indexPath.row].tempo_Travler?.carType
        print("First element : ", findCar[indexPath.row])
        return cell
    }
}



//{
//   "data": [
//        {
//            "titles": "Fruits",
//            "items": [
//                "Apple",
//                "Orange",
//                "Grapes",
//                "Berry"
//            ]
//        },
//        {
//            "titles": "Cars",
//            "items": [
//                "Honda",
//                "Tata",
//                "Mahindra",
//                "Toyota"
//            ]
//        },
//        {
//            "titles": "States",
//            "items": [
//                "Maharashtra",
//                "Punjab",
//                "Delhi",
//                "Keral"
//            ]
//        }
//    ]
//}



