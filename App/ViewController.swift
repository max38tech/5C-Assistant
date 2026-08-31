import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let statusLabel = UILabel()
    let pttButton = UIButton(type: .custom)
    let aiStatusLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(red: 0.04, green: 0.05, blue: 0.08, alpha: 1.0) // Deep slate black
        
        // Neon cyan border
        let borderView = UIView(frame: view.bounds.insetBy(dx: 20, dy: 20))
        borderView.layer.borderColor = UIColor.cyan.cgColor
        borderView.layer.borderWidth = 2.0
        borderView.isUserInteractionEnabled = false
        view.addSubview(borderView)
        
        // Header Status
        statusLabel.frame = CGRect(x: 40, y: 40, width: view.bounds.width - 80, height: 60)
        statusLabel.numberOfLines = 2
        statusLabel.font = UIFont(name: "CourierNewPS-BoldMT", size: 12)
        statusLabel.textColor = .cyan
        statusLabel.text = "SYSTEM: ANTIGRAVITY KIOSK\nNETWORK: OFFLINE | BATT: 100%"
        view.addSubview(statusLabel)
        
        // AI Speaking Status
        aiStatusLabel.frame = CGRect(x: 40, y: 150, width: view.bounds.width - 80, height: 40)
        aiStatusLabel.font = UIFont(name: "CourierNewPS-BoldMT", size: 18)
        aiStatusLabel.textColor = .green
        aiStatusLabel.textAlignment = .center
        aiStatusLabel.text = "AI: IDLE"
        view.addSubview(aiStatusLabel)
        
        // Push To Talk Button
        let btnSize: CGFloat = 80
        pttButton.frame = CGRect(x: (view.bounds.width - btnSize) / 2, y: view.bounds.height - 120, width: btnSize, height: btnSize)
        pttButton.backgroundColor = .cyan
        pttButton.layer.cornerRadius = btnSize / 2
        pttButton.setTitle("PTT", for: .normal)
        pttButton.setTitleColor(.black, for: .normal)
        pttButton.titleLabel?.font = UIFont(name: "CourierNewPS-BoldMT", size: 20)
        pttButton.addTarget(self, action: #selector(pttDown), for: .touchDown)
        pttButton.addTarget(self, action: #selector(pttUp), for: .touchUpInside)
        pttButton.addTarget(self, action: #selector(pttUp), for: .touchUpOutside)
        view.addSubview(pttButton)
    }
    
    @objc func pttDown() {
        pttButton.backgroundColor = .red
        aiStatusLabel.text = "LISTENING..."
        aiStatusLabel.textColor = .red
    }
    
    @objc func pttUp() {
        pttButton.backgroundColor = .cyan
        aiStatusLabel.text = "THINKING..."
        aiStatusLabel.textColor = .yellow
        
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.aiStatusLabel.text = "AI: IDLE"
            self.aiStatusLabel.textColor = .green
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
