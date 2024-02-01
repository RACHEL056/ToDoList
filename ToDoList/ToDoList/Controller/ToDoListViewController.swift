
import UIKit
class ToDoListViewController : UIViewController {
    
    @IBOutlet weak var todolistTV: UITableView!
    
    var pickerView: UIPickerView = UIPickerView()
    
    private var todoDict: [String: [TODO]] = ToDoManager.shared.readAllAndCategorize()
    
    //섹션으로 나눠주기
    var sortedSection: [String] {
        todoDict.keys.sorted { $0 < $1 }
    }
    
    var dataSource: [[TODO]] {
        todoDict.sorted { $0.key < $1.key }.map { $0.value }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    //테이블뷰 초기 세팅
    private func setupTableView() {
        todolistTV.register(ToDoListTableViewCell.nib(), forCellReuseIdentifier: ToDoListTableViewCell.identifier)
        todolistTV.delegate = self
        todolistTV.dataSource = self
    }
    
    //할 일 추가 알람창
    @IBAction func tappedaddlistBtn(_ sender: Any) {
        
        let alert = UIAlertController(title: "ToDo 추가\n\n\n\n", message: "추가할 task를 입력하세요", preferredStyle: .alert)
        
        alert.addTextField() {(tf) in
            tf.placeholder = "섹션"
        }
        
        alert.addTextField() {(tf) in
            tf.placeholder = "할 일"
        }
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.frame = CGRect(x: -70, y: 10, width: 270, height: 100)
        alert.view.addSubview(datePicker)
        
        pickerView.frame = CGRect(x: 0, y: 50, width: 270, height: 120)
        
        alert.view.addSubview(pickerView)
        
        let addAction = UIAlertAction(title: "추가", style: .default) { _ in
            
            guard let section = alert.textFields?[0].text,
                  !section.isEmpty,
                  let description = alert.textFields?[1].text,
                  !description.isEmpty
            else {
                return
            }
            
//            let todo = TODO(description: description, date: <#T##String#>, section: section)
        }
    }
}


extension ToDoListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDoManager.shared.datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todolistTV.dequeueReusableCell(withIdentifier: ToDoListTableViewCell.identifier, for: indexPath) as! ToDoListTableViewCell
        cell.configure(with: ToDoManager.shared.datas[indexPath.row])
        
        return cell
    }
}
