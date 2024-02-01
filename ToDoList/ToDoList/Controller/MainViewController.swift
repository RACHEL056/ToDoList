//
//  ViewController.swift
//  ToDoList
//
//  Created by 박민정 on 1/23/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var mainView: MainXibView!
    
    var model: MainModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
        model = MainModel()
        fetchModel()
    }
}

extension MainViewController {
    
    private func fetchModel() {
        model.getLogoImage { image in
            self.mainView?.updateLogoImage(image)
        }
        
        model.getCatImage { image in
            self.mainView?.updateCatImage(image)
        }
    }
}

extension MainViewController: MainXibViewDelegate {
    func checkTodo() {
        print(#function)
        //리스트 스토리보드로 연결
        let storyboard = UIStoryboard(name: "ToDoListViewController", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "ToDoListViewController") as? ToDoListViewController {
            vc.modalPresentationStyle = .automatic
            present(vc, animated: true, completion: nil)
        }
    }
    
    func goCompleteTodo() {
        print(#function)
        //완료된 리스트 스토리보드로 연결
        let storyboard = UIStoryboard(name: "CompleteViewController", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "CompleteViewController") as? CompleteViewController {
            vc.modalPresentationStyle = .automatic
            present(vc, animated: true, completion: nil)
        }
    }
    
    func reloadCatImage() {
        model.getCatImage { image in
            self.mainView.updateCatImage(image)
        }
    }
    
    func goProfile() {
        //프로파일 스토리보드로 연결
        print(#function)
        let vc = ProfileDesignViewController()
        present(vc, animated: true)
    }
}
