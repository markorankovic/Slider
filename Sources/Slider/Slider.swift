import SpriteKit

extension CGPoint {
    
    static func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return .init(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
}

public class Slider: SKNode {
        
    let region = SKShapeNode(rectOf: CGSize(width: 100, height: 10))
    
    let button = SKShapeNode(rectOf: CGSize(width: 10, height: 10))
    
    @objc public var currentValue: CGFloat = 0 {
        willSet {
            
        }
    }
    
    private var maxValue: CGFloat = 100
    
    public override init() {
        super.init()
        addChild(region)
        addChild(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let scene = scene else { return }
        let dx = (touches.first!.location(in: scene) - touches.first!.previousLocation(in: scene)).x
        if touches.first!.location(in: scene).x > region.position.x + region.frame.width/2 {
            button.position.x = region.position.x + region.frame.width
        } else if touches.first!.location(in: scene).x < region.position.x + region.frame.width/2 {
            button.position.x = region.position.x + region.frame.width
        } else {
            button.position.x += dx
        }
        let startPoint = region.position.x - region.frame.width/2
        let endPoint = region.position.x + region.frame.width/2
        let currentPoint = button.position.x
        currentValue = maxValue - ((endPoint - currentPoint) / (endPoint - startPoint))
    }
    
}
