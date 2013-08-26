Feature: Locating Neiman Marcus stores and viewing store details


@common
Scenario: User searches for stores when not connected to a network
Given I am on app home screen 
When I tap Store locator button
Then I see "Error No connection" message

@common
Scenario: Scenario: User searches for stores when store services are not working
Given I am on app home screen 
When I tap Store locator button
Then I see "Sorry we could not process your request now. Please try again later." message


