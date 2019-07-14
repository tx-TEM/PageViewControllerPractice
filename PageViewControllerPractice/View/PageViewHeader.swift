import UIKit

class PageViewHeader: UIView {
    @IBOutlet var InnerView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PageViewHeader", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError()
        }
        view.frame = bounds
        addSubview(view)
    }

    static var height: CGFloat {
        return 100
    }

}
