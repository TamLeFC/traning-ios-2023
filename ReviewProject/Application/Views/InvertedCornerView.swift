import UIKit

@IBDesignable
class InvertedCornerView: UIView {
    // define backing layer and provide computed property to make it easier to interact with
    override class var layerClass: AnyClass { return CAShapeLayer.self }
    private var shapeLayer: CAShapeLayer    { return layer as! CAShapeLayer }
    
    // a few public properties that dictate what it looks like
    // these are inspectable in case you want to show/customize this right in IB
    @IBInspectable var lineWidth: CGFloat = 5        { didSet { setNeedsLayout() } }
    @IBInspectable var corner: CGFloat = 20          { didSet { setNeedsLayout() } }
    @IBInspectable var strokeColor: UIColor = .black { didSet { shapeLayer.strokeColor = strokeColor.cgColor } }
    @IBInspectable var fillColor: UIColor = .clear   { didSet { shapeLayer.fillColor = fillColor.cgColor } }
    
    // basic lifecycle methods
    override init(frame: CGRect = .zero) {
        
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        configure()
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        updatePath()
    }
    
}

// MARK: - Private utility methods

private extension InvertedCornerView {
    
    func configure() {
        
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.fillColor = fillColor.cgColor
    }
    
    func updatePath() {
        
        let rect = bounds.insetBy(dx: lineWidth / 2, dy: lineWidth / 2)
        let path = UIBezierPath()
        
        // Top left corner
        path.move(to: CGPoint(x: rect.minX + corner, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX + corner, y: rect.minY + corner))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + corner))
        
        // Bottom left corner
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - corner))
        path.addLine(to: CGPoint(x: rect.minX + corner, y: rect.maxY - corner))
        path.addLine(to: CGPoint(x: rect.minX + corner, y: rect.maxY))
        
        // Bottom right corner
        path.addLine(to: CGPoint(x: rect.maxX - corner, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - corner, y: rect.maxY - corner))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - corner))
        
        // Top right corner
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + corner))
        path.addLine(to: CGPoint(x: rect.maxX - corner, y: rect.minY + corner))
        path.addLine(to: CGPoint(x: rect.maxX - corner, y: rect.minY))
        
        path.close()
        
        shapeLayer.path = path.cgPath
        shapeLayer.lineWidth = lineWidth
    }
    
}
