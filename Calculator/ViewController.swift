//
//  ViewController.swift
//  Calculator
//
//  Created by LDC on 10/1/14.
//  Copyright (c) 2014 LDC. All rights reserved.
//

import UIKit
import AVFoundation

var buttonState:Bool = false
var currentLang = ("en-US", "English","United States","American English ","🇺🇸")

class langPick: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {
    
    let voice = AVSpeechSynthesizer()
    
    var audioPlayer:AVAudioPlayer!
    
    var langIndex:Int = 0
    
    var myRate: Float = 0.50
    var myPitch: Float = 1.15
    var myVolume: Float = 0.92
    
   
    @IBOutlet weak var backArrow: UIButton!

    
    @IBOutlet weak var pickerView: UIPickerView!
    
    func sayThis (myString: String)
    {
        
        voice.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
        
        let myUtterance = AVSpeechUtterance(string: myString)
        myUtterance.rate = myRate
        myUtterance.pitchMultiplier = myPitch
        myUtterance.volume = myVolume
        myUtterance.voice = AVSpeechSynthesisVoice(language: currentLang.0)
        voice.speakUtterance(myUtterance)
        
    }
    
    var langAll38 = [
        ("en-US",  "English", "United States", "American English","🇺🇸"),
        ("ar-SA","Arabic","Saudi Arabia","العربية","🇸🇦"),
        ("cs-CZ", "Czech", "Czech Republic","český","🇨🇿"),
        ("da-DK", "Danish","Denmark","Dansk","🇩🇰"),
        ("de-DE",       "German", "Germany", "Deutsche","🇩🇪"),
        ("el-GR",      "Modern Greek",        "Greece","ελληνική","🇬🇷"),
        ("en-AU",     "English",     "Australia","Aussie","🇦🇺"),
        ("en-GB",     "English",     "United Kingdom", "Queen's English","🇬🇧"),
        ("en-IE",      "English",     "Ireland", "Gaeilge","🇮🇪"),
        ("en-ZA",       "English",     "South Africa", "South African English","🇿🇦"),
        ("es-ES",       "Spanish",     "Spain", "Español","🇪🇸"),
        ("es-MX",       "Spanish",     "Mexico", "Español de México","🇲🇽"),
        ("fi-FI",       "Finnish",     "Finland","Suomi","🇫🇮"),
        ("fr-CA",       "French",      "Canada","Français du Canada","🇨🇦" ),
        ("fr-FR",       "French",      "France", "Français","🇫🇷"),
        ("he-IL",       "Hebrew",      "Israel","עברית","🇮🇱"),
        ("hi-IN",       "Hindi",       "India", "हिन्दी","🇮🇳"),
        ("hu-HU",       "Hungarian",    "Hungary", "Magyar","🇭🇺"),
        ("id-ID",       "Indonesian",    "Indonesia","Bahasa Indonesia","🇮🇩"),
        ("it-IT",       "Italian",     "Italy", "Italiano","🇮🇹"),
        ("ja-JP",       "Japanese",     "Japan", "日本語","🇯🇵"),
        ("ko-KR",       "Korean",      "Republic of Korea", "한국어","🇰🇷"),
        ("nl-BE",       "Dutch",       "Belgium","Nederlandse","🇧🇪"),
        ("nl-NL",       "Dutch",       "Netherlands", "Nederlands","🇳🇱"),
        ("no-NO",       "Norwegian",    "Norway", "Norsk","🇳🇴"),
        ("pl-PL",       "Polish",      "Poland", "Polski","🇵🇱"),
        ("pt-BR",       "Portuguese",      "Brazil","Portuguese","🇧🇷"),
        ("pt-PT",       "Portuguese",      "Portugal","Portuguese","🇵🇹"),
        ("ro-RO",       "Romanian",        "Romania","Română","🇷🇴"),
        ("ru-RU",       "Russian",     "Russian Federation","русский","🇷🇺"),
        ("sk-SK",       "Slovak",      "Slovakia", "Slovenčina","🇸🇰"),
        ("sv-SE",       "Swedish",     "Sweden","Svenska","🇸🇪"),
        ("th-TH",       "Thai",        "Thailand","ภาษาไทย","🇹🇭"),
        ("tr-TR",       "Turkish",     "Turkey","Türkçe","🇹🇷"),
        ("zh-CN",       "Chinese",     "China","漢語/汉语","🇨🇳"),
        ("zh-HK",       "Chinese",   "Hong Kong","漢語/汉语","🇭🇰"),
        ("zh-TW",       "Chinese",     "Taiwan","漢語/汉语","🇹🇼")
    ]
    

    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return langAll38.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let myString = "\(langAll38[row].4) \(langAll38[row].3)"
        
        return myString
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        currentLang = langAll38[row]
        sayThis(currentLang.3)
        
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        var pickerLabel = view as! UILabel!
        if view == nil {  //if no label there yet
            pickerLabel = UILabel()
            //color the label's background
            let hue = CGFloat(row)/CGFloat(langAll38.count)
            pickerLabel.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        }
        let titleData = "\(langAll38[row].3)"
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 37.0)!,NSForegroundColorAttributeName:UIColor.blackColor()])
        pickerLabel!.attributedText = myTitle
        pickerLabel!.textAlignment = .Center
        
        return pickerLabel
        
    }
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        
        
        if (buttonState){
            self.view.backgroundColor = UIColor.blackColor()
            backArrow.titleLabel?.textColor = UIColor.whiteColor()
            

        }
        
        if(!buttonState){
            self.view.backgroundColor = UIColor.whiteColor()
            backArrow.titleLabel?.textColor = UIColor.blackColor()
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    
}

class ViewController: UIViewController {
    
    //MARK: Global Variables
    
    let voice = AVSpeechSynthesizer()
    
    var audioPlayer:AVAudioPlayer!
    
    var nineNine:AVAudioPlayer!

    var total:Int = 0
    var mode:Int = 0
    var valueString:String! = ""
    var lastButtonWasMode:Bool = false
    
    var totalIsDisplaying = false
    
    var modeSwitch:Bool = false
    
    var dayMode:Bool = false
    
    var randomCompliment = "Did you really need a calculator for that?"
    
    var hugeNum = "Holy shit that's a big number"
    
    var langIndex:Int = 0
    
    var myRate: Float = 0.50
    var myPitch: Float = 1.15
    var myVolume: Float = 0.92
    
//    var buttonState:Bool = false
    
    
    
    //MARK: - sayThis function
    
    func sayThis (myString: String)
    {
        
        voice.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
        
        let myUtterance = AVSpeechUtterance(string: myString)
        myUtterance.rate = myRate
        myUtterance.pitchMultiplier = myPitch
        myUtterance.volume = myVolume
        myUtterance.voice = AVSpeechSynthesisVoice(language: currentLang.0)
        voice.speakUtterance(myUtterance)
        
    }
    
    @IBOutlet weak var label: UILabel!
 
  
    
    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonState = false
        
//        sayThis("🍅" + "plus" + "🧀" + "plus" + "🍞" + "equals" + "🍕")
        
        // Do any additional setup after loading the view, typically from a nib.
        label.text = "Welcome"
        
        do {
            try! audioPlayer = AVAudioPlayer(contentsOfURL: NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("wildcard", ofType: "mp3")!), fileTypeHint:nil)
        }
        
        do {
            try! nineNine = AVAudioPlayer(contentsOfURL: NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("ninenine", ofType: "mp3")!), fileTypeHint:nil)
        }
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    @IBOutlet weak var langPick: UIButton!
    

    
    @IBAction func dayNight(sender: AnyObject) {
     buttonState = !buttonState
        
        if (buttonState == false){
            
            self.view.backgroundColor = UIColor.whiteColor()
            label.textColor = UIColor.darkTextColor()
            label.backgroundColor = UIColor.lightGrayColor()
            
            num1.backgroundColor = UIColor.lightGrayColor()
            num1.titleLabel?.textColor = UIColor.darkTextColor()
            num2.backgroundColor = UIColor.lightGrayColor()
            num2.titleLabel?.textColor = UIColor.darkTextColor()
            num3.backgroundColor = UIColor.lightGrayColor()
            num3.titleLabel?.textColor = UIColor.darkTextColor()
            num4.backgroundColor = UIColor.lightGrayColor()
            num4.titleLabel?.textColor = UIColor.darkTextColor()
            num5.backgroundColor = UIColor.lightGrayColor()
            num5.titleLabel?.textColor = UIColor.darkTextColor()
            num6.backgroundColor = UIColor.lightGrayColor()
            num6.titleLabel?.textColor = UIColor.darkTextColor()
            num7.backgroundColor = UIColor.lightGrayColor()
            num7.titleLabel?.textColor = UIColor.darkTextColor()
            num8.backgroundColor = UIColor.lightGrayColor()
            num8.titleLabel?.textColor = UIColor.darkTextColor()
            num9.backgroundColor = UIColor.lightGrayColor()
            num9.titleLabel?.textColor = UIColor.darkTextColor()
            num0.backgroundColor = UIColor.lightGrayColor()
            num0.titleLabel?.textColor = UIColor.darkTextColor()
            numClear.backgroundColor = UIColor.lightGrayColor()
            numClear.titleLabel?.textColor = UIColor.darkTextColor()
            
            
            numPlus.backgroundColor = UIColor(red: 0, green: 0.823912, blue:0.11628, alpha: 1)
            numMinus.backgroundColor = UIColor(red: 0, green: 0.823912, blue:0.11628, alpha: 1)
            numMult.backgroundColor = UIColor(red: 0, green: 0.823912, blue:0.11628, alpha: 1)
            numDiv.backgroundColor = UIColor(red: 0, green: 0.823912, blue:0.11628, alpha: 1)
            numEquals.backgroundColor = UIColor(red: 0, green: 0.823912, blue:0.11628, alpha: 1)
            
         
            
            
        }
        
        if (buttonState == true){
            
            num1.backgroundColor = UIColor.blueColor()
            num1.titleLabel?.textColor = UIColor.whiteColor()
            num2.backgroundColor = UIColor.blueColor()
            num2.titleLabel?.textColor = UIColor.whiteColor()
            num3.backgroundColor = UIColor.blueColor()
            num3.titleLabel?.textColor = UIColor.whiteColor()
            num4.backgroundColor = UIColor.blueColor()
            num4.titleLabel?.textColor = UIColor.whiteColor()
            num5.backgroundColor = UIColor.blueColor()
            num5.titleLabel?.textColor = UIColor.whiteColor()
            num6.backgroundColor = UIColor.blueColor()
            num6.titleLabel?.textColor = UIColor.whiteColor()
            num7.backgroundColor = UIColor.blueColor()
            num7.titleLabel?.textColor = UIColor.whiteColor()
            num8.backgroundColor = UIColor.blueColor()
            num8.titleLabel?.textColor = UIColor.whiteColor()
            num9.backgroundColor = UIColor.blueColor()
            num9.titleLabel?.textColor = UIColor.whiteColor()
            num0.backgroundColor = UIColor.blueColor()
            num0.titleLabel?.textColor = UIColor.whiteColor()
            numClear.backgroundColor = UIColor.blueColor()
            numClear.titleLabel?.textColor = UIColor.whiteColor()
            
            
            
            numPlus.backgroundColor = UIColor.blueColor()
            numPlus.titleLabel?.textColor = UIColor.whiteColor()
            numMinus.backgroundColor = UIColor.blueColor()
            numMinus.titleLabel?.textColor = UIColor.whiteColor()
            numMult.backgroundColor = UIColor.blueColor()
            numMult.titleLabel?.textColor = UIColor.whiteColor()
            numDiv.backgroundColor = UIColor.blueColor()
            numDiv.titleLabel?.textColor = UIColor.whiteColor()
            numEquals.backgroundColor = UIColor.blueColor()
            numEquals.titleLabel?.textColor = UIColor.whiteColor()
            
            
            
            self.view.backgroundColor = UIColor.blackColor()
            label.textColor = UIColor.whiteColor()
            label.backgroundColor = UIColor.blackColor()
            
        }
        

    
    }
    
    

    @IBOutlet weak var myLang: UILabel!
    //MARK: Change Color Mode
    
    @IBOutlet weak var colorSliderValue: UISlider!
    
    @IBAction func colorSlider(sender: UISlider) {
        
       
  
        
        
        if (sender.value > 0 &&  sender.value < 1){
            
            
        
            self.view.backgroundColor = UIColor.whiteColor()
            label.textColor = UIColor.darkTextColor()
            label.backgroundColor = UIColor.lightGrayColor()
            
            num1.backgroundColor = UIColor.lightGrayColor()
            num1.titleLabel?.textColor = UIColor.darkTextColor()
            num2.backgroundColor = UIColor.lightGrayColor()
            num2.titleLabel?.textColor = UIColor.darkTextColor()
            num3.backgroundColor = UIColor.lightGrayColor()
            num3.titleLabel?.textColor = UIColor.darkTextColor()
            num4.backgroundColor = UIColor.lightGrayColor()
            num4.titleLabel?.textColor = UIColor.darkTextColor()
            num5.backgroundColor = UIColor.lightGrayColor()
            num5.titleLabel?.textColor = UIColor.darkTextColor()
            num6.backgroundColor = UIColor.lightGrayColor()
            num6.titleLabel?.textColor = UIColor.darkTextColor()
            num7.backgroundColor = UIColor.lightGrayColor()
            num7.titleLabel?.textColor = UIColor.darkTextColor()
            num8.backgroundColor = UIColor.lightGrayColor()
            num8.titleLabel?.textColor = UIColor.darkTextColor()
            num9.backgroundColor = UIColor.lightGrayColor()
            num9.titleLabel?.textColor = UIColor.darkTextColor()
            num0.backgroundColor = UIColor.lightGrayColor()
            num0.titleLabel?.textColor = UIColor.darkTextColor()
            numClear.backgroundColor = UIColor.lightGrayColor()
            numClear.titleLabel?.textColor = UIColor.darkTextColor()
            
            
            numPlus.backgroundColor = UIColor(red: 1, green: 0.501961, blue:0, alpha: 1)
            numMinus.backgroundColor = UIColor(red: 1, green: 0.501961, blue:0, alpha: 1)
            numMult.backgroundColor = UIColor(red: 1, green: 0.501961, blue:0, alpha: 1)
            numDiv.backgroundColor = UIColor(red: 1, green: 0.501961, blue:0, alpha: 1)
            numEquals.backgroundColor = UIColor(red: 1, green: 0.501961, blue:0, alpha: 1)
        
            
        
        
        } else if (sender.value > 1 && sender.value < 2) {
            
            
            num1.backgroundColor = UIColor.blueColor()
            num1.titleLabel?.textColor = UIColor.whiteColor()
            num2.backgroundColor = UIColor.blueColor()
            num2.titleLabel?.textColor = UIColor.whiteColor()
            num3.backgroundColor = UIColor.blueColor()
            num3.titleLabel?.textColor = UIColor.whiteColor()
            num4.backgroundColor = UIColor.blueColor()
            num4.titleLabel?.textColor = UIColor.whiteColor()
            num5.backgroundColor = UIColor.blueColor()
            num5.titleLabel?.textColor = UIColor.whiteColor()
            num6.backgroundColor = UIColor.blueColor()
            num6.titleLabel?.textColor = UIColor.whiteColor()
            num7.backgroundColor = UIColor.blueColor()
            num7.titleLabel?.textColor = UIColor.whiteColor()
            num8.backgroundColor = UIColor.blueColor()
            num8.titleLabel?.textColor = UIColor.whiteColor()
            num9.backgroundColor = UIColor.blueColor()
            num9.titleLabel?.textColor = UIColor.whiteColor()
            num0.backgroundColor = UIColor.blueColor()
            num0.titleLabel?.textColor = UIColor.whiteColor()
            numClear.backgroundColor = UIColor.blueColor()
            numClear.titleLabel?.textColor = UIColor.whiteColor()
            
            
            
            numPlus.backgroundColor = UIColor.blueColor()
            numPlus.titleLabel?.textColor = UIColor.whiteColor()
            numMinus.backgroundColor = UIColor.blueColor()
            numMinus.titleLabel?.textColor = UIColor.whiteColor()
            numMult.backgroundColor = UIColor.blueColor()
            numMult.titleLabel?.textColor = UIColor.whiteColor()
            numDiv.backgroundColor = UIColor.blueColor()
            numDiv.titleLabel?.textColor = UIColor.whiteColor()
            numEquals.backgroundColor = UIColor.blueColor()
            numEquals.titleLabel?.textColor = UIColor.whiteColor()
            
            
            
            
            
            self.view.backgroundColor = UIColor.blackColor()
            label.textColor = UIColor.whiteColor()
            label.backgroundColor = UIColor.blackColor()
            
        } else if (sender.value > 2)
        {
            num1.backgroundColor = getRandomNumber()
            num1.titleLabel?.textColor = getRandomNumber()
            num2.backgroundColor = getRandomNumber()
            num2.titleLabel?.textColor = getRandomNumber()
            num3.backgroundColor = getRandomNumber()
            num3.titleLabel?.textColor = getRandomNumber()
            num4.backgroundColor = getRandomNumber()
            num4.titleLabel?.textColor = getRandomNumber()
            num5.backgroundColor = getRandomNumber()
            num5.titleLabel?.textColor = getRandomNumber()
            num6.backgroundColor = getRandomNumber()
            num6.titleLabel?.textColor = getRandomNumber()
            num7.backgroundColor = getRandomNumber()
            num7.titleLabel?.textColor = getRandomNumber()
            num8.backgroundColor = getRandomNumber()
            num8.titleLabel?.textColor = getRandomNumber()
            num9.backgroundColor = getRandomNumber()
            num9.titleLabel?.textColor = getRandomNumber()
            num0.backgroundColor = getRandomNumber()
            num0.titleLabel?.textColor = getRandomNumber()
            numClear.backgroundColor = getRandomNumber()
            numClear.titleLabel?.textColor = getRandomNumber()
            
            
            
            numPlus.backgroundColor = getRandomNumber()
            numPlus.titleLabel?.textColor = getRandomNumber()
            numMinus.backgroundColor = getRandomNumber()
            numMinus.titleLabel?.textColor = getRandomNumber()
            numMult.backgroundColor = getRandomNumber()
            numMult.titleLabel?.textColor = getRandomNumber()
            numDiv.backgroundColor = getRandomNumber()
            numDiv.titleLabel?.textColor = getRandomNumber()
            numEquals.backgroundColor = getRandomNumber()
            numEquals.titleLabel?.textColor = getRandomNumber()
            
            
            
        self.view.backgroundColor = getRandomNumber()
            
            label.textColor = getRandomNumber()
            
            label.backgroundColor = getRandomNumber()
            //blah
            
            audioPlayer.play()
            
            
        }
        
    }
    
    
    
    @IBOutlet weak var num7: UIButton!
    @IBOutlet weak var num8: UIButton!
    @IBOutlet weak var num9: UIButton!
    @IBOutlet weak var num4: UIButton!
    @IBOutlet weak var num5: UIButton!
    @IBOutlet weak var num6: UIButton!
    @IBOutlet weak var num1: UIButton!
    @IBOutlet weak var num2: UIButton!
    @IBOutlet weak var num3: UIButton!
    @IBOutlet weak var num0: UIButton!
    @IBOutlet weak var numClear: UIButton!
    @IBOutlet weak var numPlus: UIButton!
    @IBOutlet weak var numMinus: UIButton!
    
    @IBOutlet weak var numMult: UIButton!
    
    @IBOutlet weak var numDiv: UIButton!
    
    @IBOutlet weak var numEquals: UIButton!
    
    @IBOutlet weak var makeNeg: UIButton!
    
    //MARK: Tap Number
    
    @IBAction func tappedNumber(sender: UIButton) {
            
        let str:String! = sender.titleLabel!.text
        let num:Int! = Int(str)
            
        if (num == 0 && total == 0)
        {
            return
        }
            
        if (lastButtonWasMode)
        {
            lastButtonWasMode = false
            valueString = ""
            
        }
        
        if(totalIsDisplaying)
        {
            totalIsDisplaying = false
            valueString = ""
        }
       
        valueString = valueString.stringByAppendingString(str)
            
        
            
           
        
        let formatter:NSNumberFormatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        let n:NSNumber = formatter.numberFromString(valueString)!
        
        label.text = formatter.stringFromNumber(n)
        
        if (total == 0)
        {
            total = Int(valueString)!
        }
            sayThis("\(valueString)")
    }
    
    //MARK: - Mode Buttons
    
    @IBAction func tappedPlus(sender: AnyObject) {
        self.setMode1(1)
        sayThis("Plus")
    }
    
    @IBAction func tappedMinus(sender: AnyObject) {
        self.setMode1(-1)
        sayThis("Minus")
    }

    @IBAction func tappedMult(sender: UIButton) {
        self.setMode1(2)
        sayThis("Times")
    }
    
    @IBAction func tappedDivide(sender: UIButton) {
        self.setMode1(-2)
        sayThis("Divided by")
        
    }
    
    @IBAction func tappedNeg(sender: UIButton) {
        self.setMode1(-3)
    }
    //MARK: - Tapped Equals
    
    @IBAction func tappedEquals(sender: AnyObject) {
        if (mode == 0)
        {
            
            return
              sayThis("You didn't perform an equation dumb dumb")
          
        }
        let iNum:Int = Int(valueString)!
        if (mode == 1)
        {
            
            total += iNum
            
           
        }
        if (mode == -1)
        {
            total -= iNum
            
        }
        
        if (mode == 2)
        {
            total *= iNum
            
        }
        if (mode == -2)
        {
            total /= iNum
            
            
        }
        
    
        valueString = "\(total)"
        let formatter:NSNumberFormatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        let n:NSNumber = formatter.numberFromString(valueString)!
        
        label.text = formatter.stringFromNumber(n)
        mode = 0
        totalIsDisplaying = true
        
        if (total == 800815) {
            sayThis("Yay! Boo bees!")
        }
        else {
        
        sayThis("equals" + "\(total)")
        }
        
        if (total < 0){
            sayThis("equals negative" + "\(total)")
        }
          
          if (total > 1000000000) {
            sayThis("\(hugeNum)")
        } else if (total == 99){
            nineNine.play()
        }


        
        
    }
    
    //MARK: - Tapped Clear
    
    @IBAction func tappedClear(sender: AnyObject) {
        total = 0
        mode = 0
        valueString = ""
        label.text = "0"
        lastButtonWasMode = false
        nineNine.stop()
        audioPlayer.stop()
        
    }
    
    //MARK: - Set Mode
    
    func setMode1(m:Int)
    {
        if (total == 0)
        {
            return
        }
        mode = m
        lastButtonWasMode = true
        total = Int(valueString)!
    }
    
    //MARK: - Create Random UI Color
    
    func getRandomNumber() -> UIColor
    {
        
        let randomRed:CGFloat = CGFloat(drand48())
        
        let randomGreen:CGFloat = CGFloat(drand48())
        
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
        
    }
    
    
 

}

