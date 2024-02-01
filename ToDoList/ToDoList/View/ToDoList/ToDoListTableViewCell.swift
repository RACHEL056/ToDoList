import UIKit

//테이블뷰에 들어가는 셀 xib
class ToDoListTableViewCell: UITableViewCell {
    @IBOutlet weak var descriptiLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var completeSeg: UISegmentedControl!
    
    static let identifier = "ToDoListTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ToDoListTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //셀 할일, 날짜, 완료 여부 세팅해주는 함수
    func configure(with todo: TODO) {
        descriptiLabel.text = todo.description
        dateLabel.text = todo.date
        if todo.isComplete {
            completeSeg.selectedSegmentIndex = 0
        } else {
            completeSeg.selectedSegmentIndex = 1
        }
    }
    
}
