
import UIKit

class AcountTeacherView: UIView{
    
    //-------------------IBOutlet------------------------
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    
    //-------------------Actions------------------------
    
    @IBAction func btnGoToYourService(_ sender: UIButton) {
    }
    
    @IBAction func btnBackToMore(_ sender: UIButton) {
    }

    @IBAction func btnGoToPassword(_ sender: UIButton) {
    }
    
    @IBAction func btnGoToLocation(_ sender: UIButton) {
    }
    
    //-------------------Functions-----------------------
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("AcountTeacherView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
}
