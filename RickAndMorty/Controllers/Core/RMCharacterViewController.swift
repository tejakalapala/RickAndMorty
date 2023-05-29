//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Teja on 16/04/23.
//

import UIKit

class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "Characters"
        view.backgroundColor = .systemBackground
        RMService.shared.execute(.listCharacterRequests, expecting: RMGetAllCharactersResponse.self) { result in
            switch result{
            case .failure(let error):
                print(String(describing: error))
                
            case .success(let model):
                print(model.info.count)
            }
        }
        }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
