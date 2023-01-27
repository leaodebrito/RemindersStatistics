# Reminders Statistics 

Application showing statistics related to the development of activities listed in the Reminders application

 

## Used API's'

1. SwiftUI
2. EventKit



## Referências utilizadas
1. [Loading reminders — iOS App Dev Tutorials | Apple Developer Documentation](https://developer.apple.com/tutorials/app-dev-training/loading-reminders)

2. [Saving reminders — iOS App Dev Tutorials | Apple Developer Documentation](https://developer.apple.com/tutorials/app-dev-training/saving-reminders)

3. ...

4. ChatGPT - OpenAI


## Códigos exemplos



```
import EventKit

let eventStore = EKEventStore()

switch EKEventStore.authorizationStatus(for: .reminder) {
case .authorized:
    let reminders = eventStore.fetchReminders(matching: 
    EKReminder.predicateForReminders(in: nil))
    print("Quantidade de lembretes: \(reminders.count)")
case .denied:
    print("Acesso negado")
case .notDetermined:
    eventStore.requestAccess(to: .reminder) { (granted, error) in
        if granted {
            let reminders = eventStore.fetchReminders(matching: 
            EKReminder.predicateForReminders(in: nil))
            print("Quantidade de lembretes: \(reminders.count)")
        } else {
            print("Acesso negado")
        }
    }
case .restricted:
    print("Acesso restrito")
}
```
