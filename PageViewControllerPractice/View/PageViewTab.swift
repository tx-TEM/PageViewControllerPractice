import UIKit

class PageViewTab: UIView {
    @IBOutlet var TabAView: UIView!
    @IBOutlet var TabBView: UIView!

    var tabATapActionClosure: () -> () = {}
    var tabBTapActionClosure: () -> () = {}

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PageViewTab", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError()
        }
        view.frame = bounds
        view.backgroundColor = UIColor.red
        bind(tabATapAction: {print("tapA")}, tabBTapAction: {print("tapB")})
        addSubview(view)
    }

    func bind(tabATapAction: @escaping () -> (), tabBTapAction: @escaping () -> ()) {
        tabATapActionClosure = tabATapAction
        tabBTapActionClosure = tabBTapAction

        TabAView.isUserInteractionEnabled = true
        TabBView.isUserInteractionEnabled = true

        TabAView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabATapAction(_:))))
        TabBView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabBTapAction(_:))))
    }

    @objc func tabATapAction(_ sender: UITapGestureRecognizer) {
        tabATapActionClosure()
    }

    @objc func tabBTapAction(_ sender: UITapGestureRecognizer) {
        tabBTapActionClosure()
    }

    static var height: CGFloat {
        return 60
    }
}
