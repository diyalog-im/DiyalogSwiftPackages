//
//  ViewController.swift
//  DiyalogCarthageDeneme
//
//  Created by Tolga Cakiroglu on 23.12.2021.
//

import UIKit
import DiyalogEngine

class ViewController: UIViewController {

    @IBOutlet weak var btnStart : UIButton!
    @IBOutlet weak var btnCancel : UIButton!
    @IBOutlet weak var lblWait : UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnCancel.hideView()
        lblWait.hideView()
        
    }

    @IBAction func btnStartTapped(_ sender: UIButton) {
        
        var attachedData = [ACAttachedData]()
        attachedData.append(ACAttachedData.init(nsString: "dataName1", with: "dataValue1"))
        attachedData.append(ACAttachedData.init(nsString: "dataName2", with: "dataValue2"))
        attachedData.append(ACAttachedData.init(nsString: "dataName3", with: "dataValue3"))
        attachedData.append(ACAttachedData.init(nsString: "dataName4", with: "dataValue4"))

        DiyalogEngine.diyalogInstance().startVideoCallWithAttachedDataInBackground(idNumber: Int64("123456789") ?? 0, customerId: "123456", customerName: "customer name of 123456", txCode : "MOI", attachedData: attachedData, result: {    (success, errorMessage) in
            if(success)
            {
                self.showWait()
                DiyalogEngine.diyalogInstance().subscribeToCallStateWithTxCodeEvent(listener: {(value : String?, txCode: String?) -> Void in
                    if value != nil {
                        print("CALL STATE CHANGED TO " + value! + " FOR TxCode : " + txCode!)
                        if (value! == ("ENDED")){
                            self.showStartCallAgain();
                        }
                        else if (value! == "RINGING" || value! == "CONNECTING" || value! == "IN_PROGRESS"){
                            self.showCallInProgress();
                            
                            // Send message to remote peer from mobile app in 30.0 seconds of call as a sample
                            DispatchQueue.main.asyncAfter(deadline: .now() + 30.0) {
                                self.sendMessageToRemote();
                            }

                        }
                    }
                })
                
                DiyalogEngine.diyalogInstance().subscribeToManageCallEvent(listener: {(manageCallEvent : String?) -> Void in
                    print("MANAGECALLEVENT received. event : \(manageCallEvent)")
                    if (manageCallEvent != nil && (manageCallEvent == "CALL_MINIMIZED" || manageCallEvent == "MESSAGE_RECEIVED") ) {
                        let events = DiyalogEngine.diyalogInstance().getManageCallEventData()
                        for (key, value) in events {
                            print("MANAGECALLEVENT key : \(key) value : \(value)")
                            if (key == "command" && value == "getCardPassword"){
                                // Do something
                            }
                        }
                    }
                })

                
            }else{
                print("there is an error. ErrCode : \(String(describing: errorMessage?.getCode())). Error Msg: \(String(describing: errorMessage?.getMsg()))")
            }
        })
    }

    @IBAction func buttonCancel(_ sender: Any) {
        let result = DiyalogEngine.diyalogInstance().stopVideoCall(customerId: "123456")
        print("CALL Cancelled. Return \(result)")
        showStartCallAgain();
    }


    private func showStartCallAgain() {
        btnStart.showView()
        btnCancel.hideView()
        lblWait.hideView()
    }
    
    private func showWait(){
        btnStart.hideView()
        btnCancel.showView()
        lblWait.showView()
    }
    
    private func showCallInProgress(){
        btnStart.hideView()
        btnCancel.hideView()
        lblWait.hideView()
    }
    
    private func sendMessageToRemote(){
        var eventData = [ACEventData]()
        eventData.append(ACEventData.init(nsString: "dataName1", with: "dataValue1"))
        eventData.append(ACEventData.init(nsString: "dataName2", with: "dataValue2"))
        eventData.append(ACEventData.init(nsString: "dataName3", with: "dataValue3"))
        eventData.append(ACEventData.init(nsString: "dataName4", with: "dataValue4"))

        DiyalogEngine.diyalogInstance().sendMessageToRemote(eventData: eventData, result: {(success, resMessage) in
            print("sendMessageToRemote finished. isSuccess: \(success), resMessage: \(resMessage)")
        })
    }
}

