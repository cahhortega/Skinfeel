//
//  CircularProgressView.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 10/01/22.
//


import UIKit

class CircularProgressBarView: UIView {
    var progressLayer = CAShapeLayer() //barra de progresso
    var circleLayer = CAShapeLayer() //círculo
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeCircularPath()
    }
    var progressColor = UIColor.white {
        didSet {
            progressLayer.strokeColor = progressColor.cgColor
        }
    }
    var circleColor = UIColor.white {
        didSet {
            circleLayer.strokeColor = circleColor.cgColor
        }
    }
    //Criando o círculo
    func makeCircularPath() {
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = self.frame.size.width/2
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: (frame.size.width - 1.5)/2, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: true)
        circleLayer.path = circlePath.cgPath
        circleLayer.cornerRadius = 15
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = circleColor.cgColor
        circleLayer.lineWidth = 7.0
        circleLayer.strokeEnd = 1.0
        layer.addSublayer(circleLayer)
        progressLayer.path = circlePath.cgPath
        progressLayer.cornerRadius = 15
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.lineWidth = 7.0
        progressLayer.strokeEnd = 0.0
        layer.addSublayer(progressLayer)
    }
    func setProgress(duration: TimeInterval, value: Float) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = value
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        progressLayer.strokeEnd = CGFloat(value)
        progressLayer.add(animation, forKey: "animateprogress")
    }
}


