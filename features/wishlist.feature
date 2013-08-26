Feature: Browsing products and viewing Product details of the shop
 
 @iphone
Scenario: User views incirlce details and adds a new NM card to his account
 Given I am logged into Account screen
 And I see profile information 
 And I see account screen <"buttons">
 |buttons|
 |ViewIncircle|
 |Edit|
 |Logout|
 When I tap on "View Incircle Details" button
 Then I see Incircle screen
 And I see incircle <"buttons">
 |Buttons|
 |IncircleAddCard|
 |IncircleNoThanksButton|
 When I tap on Add card button
 Then I see add a new card screen
 And I enter details of the card
 
@ipad
Scenario: User views incirlce details and adds a new NM card to his account
 Given I am logged into Account screen
 And I see profile information 
 And I see account screen <"buttons">
 |buttons|
 |ViewIncircle|
 |Edit|
 |LogoutButton|
 When I tap on "View Incircle Details" button
 Then I see Incircle screen
 And I see a pop up screen with <"buttons">
 |Buttons|
 |IncircleAddCard|
 |IncircleNoThanksButton|
 When I tap on Add card button
 Then I see add a new card pop up
 And I enter details of the card
 
@common
Scenario: User adds an invalid credit card  and views appropriate message
  Given I am in Account screen
  When I enter valid email address and password
  And I tap SIGN IN button
  And I see My Account screen
  When I tap on Edit account info button
  Then I see Account information screen
  Then I see the following <"Details"> in Edit Acc Info section
  |Details|
  |BillingAddress|
  |CardTypeDropdown|
  |CardNumber|
  |Expiration|
  And I enter <"Inputs">
  |Inputs|
  |420 water Ave, Newyork 10025|
  |Visa|
  |0000000000000|
  |05/16|
  When I tap "Save" button
  Then I see "Invalid Credit card number. Please try again" message
  And I tap OK button
  And I see My Account screen
 
 @testipad
Scenario: User edits his credit card details
  Given I am in Account screen
  And I enter valid email address and password
  And I tap SIGN IN button
  And I see My Account screen
  When I tap on Edit account info button
  Then I see Edit Account information screen
  Then I see the following <"Details"> in Payment section
  |Details|
  |BillingAddress|
  |CardTypeDropdown|
  |CardNumber|
  |Expiration|
  And I see Save button in account screen
  And I see CANCEL button in account screen
  And I enter <"Inputs">
  |Inputs|
  |540 water Ave, Newyork 10025|
  |Master| 
  |43546568565656|
  |07/16|
  When I tap "Save" button
  And I see updated screen message as "Account information has been updated successfully"
  And I tap OK button
  Then I see Account screen displayed with credit card details
  And I see the masked updated card number
  
@iphone
Scenario: User edits his credit card details
  Given I am in Account screen
  And I enter valid email address and password
  And I tap SIGN IN button
  And I see My Account screen
  When I tap on Edit account info button
  Then I see Edit Account information screen
  Then I see the following <"Details"> in Edit Acc Info section
  |Details|
  |BillingAddress|
  |CardTypeDropdown|
  |CardNumber|
  |Expiration|
  And I see Save button in account screen
  And I see BACK button in account screen
  And I enter <"Inputs">
  |Inputs|
  |540 water Ave, Newyork 10025|
  |Master| 
  |33546568565656|
  |07/16|
  When I tap "Save" button
  And I see updated screen message as "Account information has been updated successfully"
  And I tap OK button
  Then I see Account screen displayed with credit card details
  And I see the masked updated card number
  
@common
Scenario: User views the message if the below card added is a Non NM or BG card
  Given I am in Account screen
  And I enter valid email address and password
  And I tap SIGN IN button
  And I see My Account screen
  When I tap on Edit account info button
  Then I see Edit Account information screen
  Then I see the following <"Details"> in Edit Acc Info section
  |Details|
  |BillingAddress|
  |CardTypeDropdown|
  |CardNumber|
  |Expiration|
  And I enter <"Inputs">
  |Inputs|
  |420 water Ave, Newyork 10025|
  |Visa|
  |43546568565656|
  |05/16|
  When I tap "Save" button
  Then I see "Update your NM or BG credit card to access In-Circle" message
  
  
@ipad
Scenario: User returns to the account screen by canceling the details entered in the credit card screen
  Given I am in Account screen
  And I enter valid email address and password
  And I tap SIGN IN button
  And I see My Account screen
  When I tap on Edit account info button
  Then I see Edit Account information screen
  Then I see the following <"Details"> in Payment section
  |Details|
  |BillingAddress|
  |CardTypeDropdown|
  |CardNumber|
  |Expiration|
  And I see Save button in account screen
  And I see CANCEL button in account screen
  And I enter <"Inputs">
  |Inputs|
  |420 water Ave, Newyork 10025|
  |visa| 
  |43546568565656|
  |05/16|
  When I tap CLOSE button
  Then I see Account screen displayed without card details
  
  
 @iphone
Scenario: User returns to the account screen by canceling the details entered in the credit card screen
  Given I am in Account screen
  And I enter valid email address and password
  And I tap SIGN IN button
  And I see My Account screen
  When I tap on Edit account info button
  Then I see Edit Account information screen
  Then I see the following <"Details"> in Edit Acc Info section
  |Details|
  |BillingAddress|
  |CardTypeDropdown|
  |CardNumber|
  |Expiration|
  And I see Save button in account screen
  And I see BACK button in account screen
  And I enter <"Inputs">
  |Inputs|
  |420 water Ave, Newyork 10025|
  |visa| 
  |43546568565656|
  |05/16|
  When I tap BACK button
  Then I see Account screen displayed without card details
  
@ipad11
Scenario: User views error message if an expiry date is earlier than current date
  Given I am in Account screen
  And I enter valid email address and password
  And I tap SIGN IN button
  And I see My Account screen
  When I tap on Edit account info button
  Then I see Edit Account information screen
  Then I see the following <"Details"> in Payment section
  |Details|
  |BillingAddress|
  |CardTypeDropdown|
  |CardNumber|
  |Expiration|
  And I see Save button in account screen
  And I see CANCEL button in account screen
  And I enter <"Inputs">
  |Inputs|
  |420 water Ave, Newyork 10025|
  |visa| 
  |43546568565656|
  |05/12|
  And I tap Save button
  Then I see "Expiry date cannot be earlier than current date. Please enter valid date" message
  And I tap OK button
  And I see My Account screen 
  
@iphone
Scenario: User views error message if an expiry date is earlier than current date
  Given I am in Account screen
  And I enter valid email address and password
  And I tap SIGN IN button
  And I see My Account screen
  When I tap on Edit account info button
  Then I see Edit Account information screen
  Then I see the following <"Details"> in Edit Acc Info section
  |Details|
  |BillingAddress|
  |CardTypeDropdown|
  |CardNumber|
  |Expiration|
  And I see Save button in account screen
  And I see BACK button in account screen
  And I enter <"Inputs">
  |Inputs|
  |420 water Ave, Newyork 10025|
  |visa| 
  |43546568565656|
  |05/12|
  And I tap Save button
  Then I see "Expiry date cannot be earlier than current date. Please enter valid date" message
  And I tap OK button
  And I see My Account screen 
  
  # NAD Features-------->
  
@ipad
Scenario: User views account information and Log outs from his account 
 Given I am in Home screen
 When I tap Account button
 And I enter valid email address and password
 And I tap SIGN IN button
 And I see My Account screen
 And I see the following <"Details"> in Payment section
 |Details|
 |BillingAddress|
 |ShippingAddress|
 |PaymentMethod|
 And I see account screen <"buttons">
 |buttons|
 |Edit|
 |ViewIncircle|
 |LogoutButton|
 And I see wish lists section
 And I see Log Out button
 When I tap Log out button
 Then I see Home screen
 
 @iphone
Scenario: User views account information and Log outs from his account 
 Given I am in Home screen
 When I tap Account button
 And I enter valid email address and password
 And I tap SIGN IN button
 And I see My Account screen
 And I see the following <"Details"> in Payment section
 |Details|
 |BillingAddress|
 |ShippingAddress|
 |PaymentMethod|
 And I see account screen <"buttons">
 |buttons|
 |Edit|
 |ViewIncircle|
 |LogoutButton|
 |Back|
 And I see wish lists section
 And I see Log Out button
 When I tap Log out button
 Then I see Home screen
 
 @ipad
Scenario: User views account information edit his name and address 
 Given I am in Home screen
 When I tap Account button
 And I enter valid email address and password
 And I tap SIGN IN button
 And I see My Account screen
 When I tap on Edit account Information button
 Then I see the following <"Details"> in Payment section
 |Details|
 |FirstName|
 |LastName|
 |ShippingAddress|
 And I see Save button
 And I see Close button
 And I Change a name in First name field
 Then I Change a name in Last name field
 And I change address in Shipping address field
 And I tap Save button
 Then I see message as Account information has been updated successfully
 And I tap OK button
 And I see My Account screen
 
 @iphone
Scenario: user views account information edit his name and address 
 Given I am in Home screen
 When I tap Account button
 And I enter valid email address and password
 And I tap SIGN IN button
 And I see My Account screen
 When I tap on Edit account Information button
 Then I see the following <"fields"> in Payment section
 |fields|
 |FirstName|
 |LastName|
 |ShippingAddress|
 And I see Save button
 And I see Back button 
 And I Change a name in First name field
 Then I Change a name in Last name field
 And I change address in Shipping address field
 And I tap Save button
 Then I see message as Account information has been updated successfully
 And I tap OK button
 And I see My Account screen  
 #Flow is wrong needs to discuss with manual qa.
 
 @ipad
 Scenario: User view appropriate error message when changed security answer
 Given I am in Home screen
 When I tap Account button
 And I enter valid email address and password
 And I tap SIGN IN button
 And I see My Account screen
 When I tap on Edit account Information button
 Then I see the following <"fields"> in Payment section
 |fields|
 |OldPassword|
 |NewPassword|
 |ReEnter|
 |SecurityQuestion|
 |SecurityAnswer|
 And I see Save button
 And I see Close button
 Then I enter a Old Password in Old Password field
 Then I enter a New password in New Password Field
 Then I enter the same New password in Confirm Password Field
 And I change security answer
 And I tap Save button
 Then I see message as "Security answer does not match with the answer on the profile. Please try again"
 And I tap OK button 
 And I see My Account screen
 
 @iphone
 Scenario: User view appropriate error message when changed security answer
 Given I am in Home screen
 When I tap Account button
 And I enter valid email address and password
 And I tap SIGN IN button
 And I see My Account screen
 When I tap on Edit account Information button
 Then I see the following <"fields"> in Payment section
 |fields|
 |OldPassword|
 |NewPassword|
 |ReEnter|
 |SecurityQuestion|
 |SecurityAnswer|
 And I see Save button
 And I see Back button
 Then I enter a Old Password in Old Password field
 Then I enter a New password in New Password Field
 Then I enter the same New password in Confirm Password Field
 And I change security answer     
 And I tap Save button
 Then I see message as "Security answer does not match with the answer on the profile. Please try again"
 And I tap OK button 
 And I see My Account screen
 #  Answer field is not allows to edit. So script fails.
 
 @ipad
Scenario: User views error message when entered incorrect passwords in "Account" screen
 Given I am in Home screen
 When I tap Account button
 And I enter valid email address and password
 And I tap SIGN IN button
 And I see My Account screen
 When I tap on Edit account Information button
 Then I see the following <"fields"> in Payment section
 |fields|
 |OldPassword|
 |NewPassword|
 |ReEnter|
 |SecurityQuestion|
 |SecurityAnswer|
 Then I enter a Old Password in Old Password field
 Then I enter a New password in New Password Field
 Then I enter the incorrect New password in Confirm password Field
 And I tap Save button
 And I see "Password does not match. Please try again." error message
 
 @iphone
Scenario: User views error message when entered incorrect passwords in "Account" screen
 Given I am in Home screen
 When I tap Account button
 And I enter valid email address and password
 And I tap SIGN IN button
 And I see My Account screen
 When I tap on Edit account Information button
 Then I see the following <"fields"> in Payment section
 |fields|
 |OldPassword|
 |NewPassword|
 |ReEnter|
 |SecurityQuestion|
 |SecurityAnswer|
 Then I enter a Old Password in Old Password field
 Then I enter a New password in New Password Field
 Then I enter the incorrect New password in Confirm password Field
 And I tap Save button 
 And I see "Password does not match. Please try again." error message
  #  Answer field is not allows to edit. So script fails.
  
  @ipad
Scenario: User updates his account details and navigates back without saving the changes
 Given I am in Home screen
 When I tap Account button
 And I enter valid email address and password
 And I tap SIGN IN button
 And I see My Account screen
 When I tap on Edit account Information button
 Then I see the following <"fields"> in Payment section
 |fields|
 |OldPassword|
 |NewPassword|
 |ReEnter|
 |SecurityQuestion|
 |SecurityAnswer|
 And I see Save button
 And I see Close button
 Then I enter a Old Password in Old Password field
 Then I enter a New password in New Password Field
 Then I enter the same New password in Confirm Password Field
 And I change security answer
 And I tap Close button
 And I see My Account screen 
  
  
  @iphone
Scenario: User updates his account details and navigates back without saving the changes
 Given I am in Home screen
 When I tap Account button
 And I enter valid email address and password
 And I tap SIGN IN button
 And I see My Account screen
 When I tap on Edit account Information button
 Then I see the following <"fields"> in Payment section
 |fields|
 |OldPassword|
 |NewPassword|
 |ReEnter|
 |SecurityQuestion|
 |SecurityAnswer|
 And I see Save button
 And I see Back button
 Then I enter a Old Password in Old Password field
 Then I enter a New password in New Password Field
 Then I enter the same New password in Confirm Password Field
 And I change security answer
 And I tap BACK button
 And I see My Account screen
 
 @iphone
Scenario: User views message when successfully changed his password
 Given I am in Home screen
 When I tap Account button
 And I enter valid email address and password
 And I tap SIGN IN button
 And I see My Account screen
 When I tap on Edit account Information button
 Then I see the following <"fields"> in Payment section
 |fields|
 |OldPassword|
 |NewPassword|
 |ReEnter|
 |SecurityQuestion|
 |SecurityAnswer|
  And I see Save button
  And I see Back button
  Then I enter a Old Password in Old Password field
  Then I enter a New password in New Password Field
  Then I enter the same New password in Confirm Password Field
  And I tap Save button
  And I see "Account information has been updated successfully" error message
  And I tap OK button
  And I see My Account screen
  
  @ipad
Scenario: User views message when successfully changed his password
 Given I am in Home screen
 When I tap Account button
 And I enter valid email address and password
 And I tap SIGN IN button
 And I see My Account screen
 When I tap on Edit account Information button
 Then I see the following <"fields"> in Payment section
 |fields|
 |OldPassword|
 |NewPassword|
 |ReEnter|
 |SecurityQuestion|
 |SecurityAnswer|
 And I see Save button
 And I see Back button
 Then I enter a Old Password in Old Password field
 Then I enter a New password in New Password Field
 Then I enter the same New password in Confirm Password Field
 And I tap Save button
 And I see "Account information has been updated successfully" error message
 And I tap OK button
 And I see My Account screen
  
 @ipad  
Scenario: User adds new credit card to his account 
 Given I am in Home screen
 When I tap Account button
 And I enter valid email address and password
 And I tap SIGN IN button
 And I see My Account screen
 When I tap on Edit account Information button
 And I see the following <"Details"> in Payment section
 |Details|
 |CardTypeDropdown|
 |Expiration|
 |CardNumber|
 |BillingAddress|
 And I see Save button
 And I see Close button
 And I enter <"Inputs">
 |Inputs|
 |420 water Ave, Newyork 10025|
 |visa|
 |43546568565656|
 |05/16|
 When I tap Save button
 Then I see message as Account information has been updated successfully
 And I tap OK button 
 And I see My ACCOUNT screen displayed with credit card details
 And I see the masked card number
 
 @iphone
Scenario: User adds new credit card to his account 
 Given I am in Home screen
 When I tap Account button
 And I enter valid email address and password
 And I tap SIGN IN button
 And I see My Account screen
 When I tap on Edit account Information button
 And I see the following <"Details"> in Edit Screen Section
 |Details|
 |CardTypeDropdown|
 |Expiration|
 |CardNumber|
 |BillingAddress|
 And I see Save button
 And I see Back button
 And I enter <"Inputs">
 |Inputs|
 |420 water Ave, Newyork 10025|
 |visa|
 |43546568565656| 
 |05/16|
 When I tap Save button
 Then I see message as Account information has been updated successfully
 And I tap OK button
 And I see My ACCOUNT screen displayed with credit card details
 And I see the masked card number
    
@ipad
Scenario: User views incirlce details without adding NM card
 Given I am logged into Account screen
 And I see profile information 
 And I see account screen <"buttons">
 |buttons|
 |Edit|
 |ViewIncircle|
 |LogoutButton|
 When I tap on "View Incircle Details" button
 Then I see Incircle screen
 And I see incircle <"buttons">
 |Buttons|
 |IncircleAddCard|
 |IncircleNoThanksButton|
 When I tap on No Thanks button
 Then I see Incircle screen
 
 @iphone
Scenario: User views incirlce details without adding NM card
 Given I am logged into Account screen
 And I see profile information 
 And I see account screen <"buttons">
 |buttons|
 |Edit|
 |ViewIncircle|
 |LogoutButton|
 When I tap on "View Incircle Details" button
 Then I see Incircle screen
 And I see incircle <"buttons">
 |Buttons|
 |IncircleAddCard|
 |IncircleNoThanksButton|
 When I tap on No Thanks button
 Then I see Incircle screen
  
@ipad
Scenario: User updates his card details with a valid BG Or NM Card
 Given I am logged into Account screen
 And I see profile information 
 And I see account screen <"buttons">
 |buttons|
 |Edit|
 |ViewIncircle|
 |LogoutButton|
 When I tap on "View Incircle Details" button
 Then I see Incircle screen
 And I see incircle <"buttons">
 |Buttons|
 |IncircleAddCard|
 |IncircleNoThanksButton|
 When I tap on Add card button
 Then I see add a new card screen
 And I enter details of the card
  
@iphone
Scenario: User updates his card details with a valid BG Or NM Card
 Given I am logged into Account screen
 And I see profile information 
 And I see account screen <"buttons">
 |buttons|
 |Edit|
 |ViewIncircle|
 |LogoutButton|
 When I tap on "View Incircle Details" button
 Then I see Incircle screen
 And I see incircle <"buttons">
 |Buttons|
 |IncircleAddCard|
 |IncircleNoThanksButton|
 When I tap on Add card button
 Then I see add a new card screen
 And I enter details of the card
 
 @ipad
Scenario: User cancels his entry of updating credit card details
 Given I am logged into Account screen
 And I see profile information 
 And I see account screen <"buttons">
 |buttons|
 |Edit|
 |ViewIncircle|
 |LogoutButton|
 When I tap on "View Incircle Details" button
 Then I see Incircle screen
 And I see incircle <"buttons">
 |Buttons|
 |IncircleAddCard|
 |IncircleNoThanksButton|
 When I tap on No Thanks button
 Then I see Incircle screen
 
 @iphone
Scenario: User cancels his entry of updating credit card details
 Given I am logged into Account screen
 And I see profile information 
 And I see account screen <"buttons">
 |buttons|
 |Edit|
 |ViewIncircle|
 |LogoutButton|
 When I tap on "View Incircle Details" button
 Then I see Incircle screen
 And I see incircle <"buttons">
 |Buttons|
 |IncircleAddCard|
 |IncircleNoThanksButton|
 When I tap on No Thanks button
 Then I see Incircle screen
 