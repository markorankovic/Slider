public protocol Slideable {

    associatedtype T
    
    func configureSlideableSettings()
    
    func bindToSlider(value: T) -> Slider
    
}
