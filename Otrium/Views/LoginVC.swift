//
//  ViewController.swift
//  Otrium
//
//  Created by Spemai-Macbook on 2021-03-24.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Network.shared.apollo.fetch(query: UserQuery(name: "dilum1995") ) { result in

            switch result {

            case .success(let gResult):

                do {
                    
                    if let result_data = gResult.data {
                        
                        let data = try JSONSerialization.data(withJSONObject: result_data.user!.jsonObject, options: .prettyPrinted)

                        let result =  try JSONDecoder().decode(User.self, from: data)
                         print(result)
                    }
                    
                }
                catch let err {
                    print(err)
                    
                }
                
                
            case .failure(let error):
                print("error: \(error)")
            }

        }
    }


}

