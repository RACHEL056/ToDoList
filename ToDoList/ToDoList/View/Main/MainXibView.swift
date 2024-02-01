//
//  MainXibView.swift
//  ToDoList
//
//  Created by 박민정 on 1/23/24.

import UIKit

protocol MainXibViewDelegate: AnyObject {
    func checkTodo()
    func goCompleteTodo()
    func reloadCatImage()
    func goProfile()
}

class MainXibView: UIView {
    @IBOutlet weak var logoIV: UIImageView!
    @IBOutlet weak var checkTodolistBtn: UIButton!
    @IBOutlet weak var checkCompleteBtn: UIButton!
    @IBOutlet weak var catIV: UIImageView!
    @IBOutlet weak var checkprofileBtn: UIButton!
    
    weak var delegate: MainXibViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    public func updateLogoImage(_ image: UIImage?) {
        DispatchQueue.main.async {
            self.logoIV.image = image
        }
    }
    
    public func updateCatImage(_ image: UIImage?) {
        DispatchQueue.main.async {
            self.catIV.image = image
        }
    }
    
    @IBAction func tappedcheckTodoBtn(_ sender: UIButton) {
        self.delegate?.checkTodo()
    }
    
    @IBAction func tappedcheckCompleteBtn(_ sender: UIButton) {
        self.delegate?.goCompleteTodo()
    }
    
    @IBAction func tappedreloadBtn(_ sender: UIButton) {
        self.delegate?.reloadCatImage()
    }
    
    @IBAction func tappedprofileBtn(_ sender: UIButton) {
        self.delegate?.goProfile()
    }
    
}
    

//MainViewXib를 MainView에 올려주는 작업
extension MainXibView {
    private func customInit() {
        if let view = Bundle.main.loadNibNamed("MainViewXib", owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            addSubview(view)
        }
    }
}
