//
//  ViewController.swift
//  Drive_safety
//
//  Created by Game on 2020/06/07.
//  Copyright © 2020 Game. All rights reserved.
//

import UIKit
import Speech

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var transcribeButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func startTranscribing(_ sender: Any) {
        transcribeButton.isEnabled = false
        stopButton.isEnabled = true
        try! startSession()
    }
    @IBAction func stopTranscribing(_ sender: Any) {
        if audioEngine.isRunning {
            audioEngine.stop()
            speechRecognitionRequest?.endAudio()
            transcribeButton.isEnabled = true
            stopButton.isEnabled = false
        }
        
        switch (self.textView.text) {
        case "2012" : self.pickerView.selectRow(0, inComponent: 0, animated: true); selected_year = yearSelectDataSource[0]
            break
        case "2013" : self.pickerView.selectRow(1, inComponent: 0, animated: true);
            selected_year = yearSelectDataSource[1]
            break
        case "2014" : self.pickerView.selectRow(2, inComponent: 0, animated: true);
            selected_year = yearSelectDataSource[2]
            break
        case "2015" : self.pickerView.selectRow(3, inComponent: 0, animated: true);
            selected_year = yearSelectDataSource[3]
            break
        case "2016" : self.pickerView.selectRow(4, inComponent: 0, animated: true);
            selected_year = yearSelectDataSource[4]
            break
        case "2017" : self.pickerView.selectRow(5, inComponent: 0, animated: true);
            selected_year = yearSelectDataSource[5]
            break
        case "2018" : self.pickerView.selectRow(6, inComponent: 0, animated: true);
            selected_year = yearSelectDataSource[6]
            break
        default: break
        }
    }
    
    func startSession() throws {
        if let recognitionTask = speechRecognitionTask {
            recognitionTask.cancel()
            self.speechRecognitionTask = nil
        }
        
        let audioSession = AVAudioSession.sharedInstance()
        try audioSession.setCategory(AVAudioSession.Category.record)
        
        speechRecognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        guard let recognitionRequest = speechRecognitionRequest
        else {
            fatalError("SFSpeechAudioBufferRecognitionRequest object creation failed")
        }
        
        let inputNode = audioEngine.inputNode
        recognitionRequest.shouldReportPartialResults = true
        
        speechRecognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest) { result, error in
            var finished = false
            
            if let result = result {
                self.textView.text =
                    result.bestTranscription.formattedString
                finished = result.isFinal
            }
            if error != nil || finished {
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                
                self.speechRecognitionRequest = nil
                self.speechRecognitionTask = nil
                
                self.transcribeButton.isEnabled = true
            }
        }
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            
            self.speechRecognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        try audioEngine.start()
    }
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ko-KR"))!
    
    private var speechRecognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var speechRecognitionTask: SFSpeechRecognitionTask?
    
    private let audioEngine = AVAudioEngine()
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var yearSelectDataSource = ["2012", "2013", "2014", "2015", "2016", "2017", "2018"]
    @IBAction func doneToSearchViewController(segue:UIStoryboardSegue){
    }
    
    var selected_year: String = "2012"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToNameSearch" {
            if let navController = segue.destination as? UINavigationController {
                if let searchByName = navController.topViewController as?
                    SearchByName {
                    searchByName.year = selected_year
                }
            }
        }
        if segue.identifier == "segueToDirectSearch" {
            if let navController = segue.destination as? UINavigationController {
                if let SiDoTableViewController = navController.topViewController as?
                    siDoTableViewController {
                    SiDoTableViewController.year = selected_year
                }
            }
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return yearSelectDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return yearSelectDataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent compnent: Int) {
        if row == 0 {
            selected_year = yearSelectDataSource[0]
        }
        else if row == 1 {
            selected_year = yearSelectDataSource[1]
        }
        else if row == 2 {
            selected_year = yearSelectDataSource[2]
        }
        else if row == 3 {
            selected_year = yearSelectDataSource[3]
        }
        else if row == 4 {
            selected_year = yearSelectDataSource[4]
        }
        else if row == 5 {
            selected_year = yearSelectDataSource[5]
        }
        else {
            selected_year = yearSelectDataSource[6]
        }
    }
    
    func authorizeSR() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized:
                    self.transcribeButton.isEnabled = true
                    
                case .denied:
                    self.transcribeButton.isEnabled = false
                    self.transcribeButton.setTitle("Speech recognition access denied by user", for: .disabled)
                    
                case .restricted:
                    self.transcribeButton.isEnabled = false
                    self.transcribeButton.setTitle("Speech recognition restricted on device", for: .disabled)
                    
                case .notDetermined:
                    self.transcribeButton.isEnabled = false
                    self.transcribeButton.setTitle("Speech recognition not authorized", for: .disabled)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
        // Do any additional setup after loading the view.
        
        let userDefaults = UserDefaults.standard
        let decoded = userDefaults.data(forKey: "bookmarks")
        if decoded == nil {
            let init_bookmark:[Detail_info] = []
            let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: init_bookmark)
            userDefaults.set(encodedData, forKey: "bookmarks")
            userDefaults.synchronize()
        }
    }
}

