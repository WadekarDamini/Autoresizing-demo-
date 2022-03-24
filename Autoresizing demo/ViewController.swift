//
//  ViewController.swift
//  Autoresizing demo
//
//  Created by Shubham Shinde on 23/03/22.
//

import UIKit

//struct Result: Codable {
//    let data: [ResultIten]
//}
//
//struct ResultIten: Codable {
//    let titles: String
//    let items: [item]
//}

//struct item: Codable {
//    let Apple: String
//    let Orange: String
//    let Grapes: String
//    let Berry: String
//}


struct carTypes: Codable {
    let Sedan: Result
    let SUV: Result
    let Tempo_Travler: Result
}

struct Result: Codable {
    let carType: String
    let availabel: String
    let fare: String
    let ac: String
    let seater: String
    let bags: String
    let cars: [CarsModel]
}

struct CarsModel: Codable {
    let carName: String
    let serviceType: String
    let availabel: String
    let fare: String
    let carModels: [Models]
}

struct Models: Codable {
    let modelYear: String
    let ratings: String
    let fare: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
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
        
        loadJson()
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
                print("get result:",result)
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
        cell.carTypeLabel.text = findCar[indexPath.row].Sedan.carType
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



