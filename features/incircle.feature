Feature: User view In-circle Program information, account status, balance point and perk cards.

Background Given I am using Neiman Marcus Application using a device in a network

@ipad
@iphone
Scenario:User view In-Circle Program Information
 Given I am in Home screen
 When I tap In-Circle Tab
 #And I am not logged into the app
 Then I see circle tabs
 And I tap on the circle tabs 
 And I see Circle benefit content
 And I see View Full site button
 When I tap on View Full site button
 Then I see In-Circle Program tutorial
 
@ipad
@iphone
Scenario: User views their Gift/perk cards
 Given I am in Home screen
 When I tap In-Circle Tab
 And I am logged into the app
 Then I see list of gift/perk cards
 And I scroll to view more gift/perk cards
 And I tap on the card image
 And I see the following <"information"> in a pop up
 |information|
 |Card Value|
 |Balance on Card|
 |GIFT CARD NUMBER|
 |CIN|
 |Date Issued|
 |Expiration|
 And I see the <"buttons">
 |buttons|
 |COPY|
 |DONE|
 When I tap Copy button
 Then I see the card number copied in clipboard
 When I tap Done button
 Then I see the pop up closed
 
 @ipad
Scenario:User redirects to In-circle screen without updating card
 Given I am in Home screen
 When I tap In-Circle Tab
 And I am logged into the app
 #Then I see a pop up Access account page to update your NM or BG Card
 #And I see popup <"buttons">
 #|buttons|
 #|ADD CARD|
 #|NO THANKS|
 #When I tap No Thanks button
 Then I see Circle Information screen

@iphone
Scenario:User redirects to In-circle screen without updating card
 Given I am in Home screen
 When I tap In-Circle Tab
 And I am logged into the app
 #Then I see a pop up Access account page to update your NM or BG Card
 #And I see popup <"buttons">
 #|buttons|
 #|UPDATE CARD|
 #|NO THANKS|
 #When I tap No Thanks button
 Then I see Circle Information screen
 
@iphone
@ipad
Scenario:User views appropriate message when there are no gift/perk cards added
 Given I am in Home screen
 When I tap In-Circle Tab
 And I am logged into the app
 Then I see there are no gift/perk cards
 And I see "No Perk cards found. Earn one now!" 
 
 @ipad
Scenario: User updates his card and views his account status and Balance points 
 Given I am in Home screen
 When I tap In-Circle Tab
 And I am logged into the app
 #Then I see a pop up Access account page to update your NM or BG Card
 #And I see popup <"buttons">
 #|buttons|
 #|ADD CARD|
 #|NO THANKS|
 #When I tap Add card button
 #Then I see Card details pop up
 #And I update all the details
 #And I tap Done button
 And I see Incircle screen
 And I see point details associated to the card
 And I see Account status and circle level information
 And I see the following in landing <"screen">
 |screen|
 |signInTotalPoints|
 |signInRedeemHeading|
 |signInAvailablePoints|
 |signInGiftCardPointsAway|
 And I see  incircle <"buttons">
 |buttons|
 |signInLearnMoreButton|
 |signInViewFullSiteButton|
 When I tap Learn More button
 Then I see Generic information about the circle
 When I tap View Full site	
 #Then I get redirected to the external Browser
 #And I relaunch the app to view the same screen
 
 @testiphone
Scenario: User updates his card and views his account status and Balance points 
 Given I am in Home screen
 When I tap In-Circle Tab
 And I am logged into the app
 #Then I see a pop up Access account page to update your NM or BG Card
 #And I see popup <"buttons">
 #|buttons|
 #|ADD CARD|
 #|NO THANKS|
 #When I tap Add card button
 #Then I see Card details pop up
 #And I update all the details
 #And I tap Done button
 And I see Incircle screen
 And I see point details associated to the card
 And I see Account status and circle level information
 And I see the following in landing <"screen">
 |screen|
 |signInTotalPoints|
 |signInRedeemHeading|
 |signInAvailablePoints|
 |signInGiftCardPointsAway|
 And I see  incircle <"buttons">
 |buttons|
 |signInLearnMoreButton|
 |signInViewFullSiteButton|
 When I tap Learn More button
 Then I see Generic information about the circle
 When I tap View Full site	
 #Then I get redirected to the external Browser
 #And I relaunch the app to view the same screen
 