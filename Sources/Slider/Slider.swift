import SpriteKit
import Combine

extension CGPoint {
    
    static func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return .init(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
}

public class Slider: SKNode {
    
    public override var isUserInteractionEnabled: Bool {
        set {
    
        }
        get {
            return true
        }
    }
        
    let region = SKShapeNode(rectOf: CGSize(width: 400, height: 50))
    
    let button = Button(rectOf: CGSize(width: 60, height: 60))
    
    let currentValueCount = SKLabelNode()
    
    @Published public var currentValue: CGFloat = 0
    
    private var maxValue: CGFloat = 0
    
    private var minValue: CGFloat = 0
    
    public init(minValue: CGFloat, maxValue: CGFloat, name: String) {
        super.init()
        self.minValue = minValue
        self.maxValue = maxValue
        addChild(region)
        let text = SKLabelNode(text: name)
        text.fontColor = .black
        region.addChild(text)
        addChild(button)
        button.addChild(currentValueCount)
        button.position.x = -region.frame.width/2
        button.constraints = [
            .distance(
                .init(
                    lowerLimit: -region.frame.width/2,
                    upperLimit: region.frame.width/2
                ),
                to: self
            )
        ]
        zPosition = 10
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let scene = scene else { return }
        let p = touches.first!.location(in: scene)
        button.position.x = scene.convert(p, to: self).x
        let startPoint = region.position.x - region.frame.width/2
        let endPoint = region.position.x + region.frame.width/2
        let currentPoint = button.position.x
        let v = (maxValue - minValue) * ((currentPoint - startPoint) / (endPoint - startPoint))
        currentValue = (v < minValue ? minValue : v > maxValue ? maxValue : v)
        currentValueCount.text = "\(currentValue)"
    }
    
}
