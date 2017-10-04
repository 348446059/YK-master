//
//  ViewController.swift
//  YNLive
//
//  Created by libo on 2017/10/3.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var live: YKCell!
    var playerView :UIView!
    var ijkPlayer:IJKMediaPlayback!
    
    
    @IBOutlet weak var imgBack:UIImageView!
    
    @IBOutlet weak var btnLike:UIButton!
    
    @IBOutlet weak var btnGift:UIButton!
    @IBOutlet weak var btnBack:UIButton!
    
    
    @IBAction func tapBack(_ sender:UIButton){
        ijkPlayer.shutdown()
        navigationController?.popViewController(animated: true)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func tapGift(_ sender:UIButton){
        let duration = 3.0
        let car = UIImageView(image: #imageLiteral(resourceName: "porsche"))
        
        car.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        view.addSubview(car)
        
        let widthCar:CGFloat = 250
        let heightCar:CGFloat = 125
        
        UIView.animate(withDuration: duration, animations: {
            car.frame = CGRect(x: self.view.center.x - widthCar/2, y: self.view.center.y - heightCar/2, width: widthCar, height: heightCar)
        }, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+duration) {
            UIView.animate(withDuration: duration, animations: {
                car.alpha = 0
            }, completion: { (complete) in
                car.removeFromSuperview()
            })
        }
        
        let layerFw = CAEmitterLayer()
        view.layer.addSublayer(layerFw)
        emmitParticles(from: sender.center, emitter: layerFw, in: view)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+duration*2) {
            layerFw.removeFromSuperlayer()
        }
        
        
    }
    
    @IBAction func tapLike(_ sender:UIButton){
        let heart = DMHeartFlyView(frame:CGRect(x: 0, y: 0, width: 40, height: 40))
        
        heart.center = btnLike.frame.origin
        
        view.addSubview(heart)
        heart.animate(in: view)
        
        
        //爱心按钮大小的关键帧
        let btnAnime = CAKeyframeAnimation(keyPath: "transform.scale")
        btnAnime.values = [1.0,0.7,0.5,0.3,0.5,0.7,1.0,1.2,1.4,1.2,1.0]
        btnAnime.keyTimes = [0.0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0]
        btnAnime.duration = 0.2
        sender.layer.add(btnAnime, forKey: "show")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dump(live)
        
        setPlayerView()
        bringBtnToFront()
    }
    
    func setPlayerView()  {
        playerView = UIView(frame: view.bounds)
        view.addSubview(playerView)
       
        ijkPlayer = IJKFFMoviePlayerController(contentURLString: live.url, with: nil)
        
        let pv = ijkPlayer.view
        
        pv!.frame = playerView.bounds
        pv!.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        playerView.insertSubview(pv!, at: 1)
        ijkPlayer.scalingMode = .aspectFit
    }
    func setBG()  {
        imgBack.kf.setImage(with: URL(string: live.protrait))
        
        let blurEffect = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.frame = UIScreen.main.bounds
        imgBack.addSubview(effectView)
    }
    
    func bringBtnToFront()  {
        view.bringSubview(toFront: btnBack)
        view.bringSubview(toFront: btnLike)
        view.bringSubview(toFront: btnGift)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setBG()
        if !self.ijkPlayer.isPlaying(){
            ijkPlayer.prepareToPlay()
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        dump(NSStringFromCGRect(imgBack.bounds))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

