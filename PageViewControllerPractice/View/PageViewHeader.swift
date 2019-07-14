import UIKit

class PageViewHeader: UIView {
    @IBOutlet var InnerView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func commonInit() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PageViewHeader", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError()
        }
        view.frame = bounds
        view.backgroundColor = UIColor.red
        addSubview(view)
    }

}
