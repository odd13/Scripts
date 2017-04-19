''''''''''''''''''''''''''''''''''
' Original function written by Diane Poremsky: http://www.slipstick.com/developer/send-email-outlook-reminders-fires/
' Application_Reminder will listen for a reminder on a celendar entry
' You need to set the location in the calendar entry to the emails you want to notify
' The subject will be the email subject
' The Body is the email body
' Once the reminder for the calendar entry is triggered and email is sent.
' 
' # In Outlook: Open Dev window (ALT + F11) and place this script in "ThisOutlookSession"
' # In Outlook: Create a new Category.
' The new created Category (how to) should be called Automated Email Sender (this is an arbitrary title, but if you change it, make sure to change it in the macro too)."Send Schedule Recurring Email"
' # In Outllok: Create a Calendar appointment.
' Place the recipient emails in the "Location" field.
' The "Subject" field of the appointment will be used as the Subject field of the email.
' The "Body" of the appointment will be the Body of the email.
' Set up the appointment to recur on whatever schedule you want. Make sure to set a reminder.
' Set up the reminder time
' Also, don't forget to assign the Category that you created in the previous step.
''''''''''''''''''''''''''''''''''
Private Sub Application_Reminder(ByVal Item As Object)
  Dim MItem As MailItem
  Set MItem = Application.CreateItem(olMailItem)
If Item.MessageClass <> "IPM.Appointment" Then Exit Sub
If Item.Categories <> "Send Schedule Recurring Email" Then Exit Sub
  MItem.To = Item.Location
  MItem.Subject = Item.Subject
  MItem.Body = Item.Body
  MItem.Send
  Set MItem = Nothing
End Sub
