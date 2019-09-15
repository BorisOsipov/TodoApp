import UIKit

protocol AddItemViewConrollerDelegate: class {
    func addItemViewControllerDidCancel(_ controler: AddItemViewController)
    func addItemViewController(_ controler: AddItemViewController, didFinishAdding item: ChecklistItem)
}


class AddItemViewController: UITableViewController {
   
    weak var delegate: AddItemViewConrollerDelegate?

    @IBOutlet weak var addBarButton: UIBarButtonItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        delegate?.addItemViewControllerDidCancel(self)
    }

    @IBAction func done(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        let item = ChecklistItem()
        if let textFieldText = textField.text {
            item.text = textFieldText
        }
        delegate?.addItemViewController(self, didFinishAdding: item)
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
    }
    
}

extension AddItemViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let oldText = textField.text,
            let stringRange = Range(range, in: oldText) else {
                return false
        }
        
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        if newText.isEmpty {
            addBarButton.isEnabled = false
        } else {
            addBarButton.isEnabled = true
        }
        return true
    }
}
