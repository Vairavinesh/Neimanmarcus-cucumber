#Feature: Locating Neiman Marcus stores and viewing shop details
#@common
#Scenario: As a NM app user when I search the products with invalid data,application should display appropriate message
# Given I am in Shop screen
# And I tap on the Search box 
# Then I see the keypad enabled
# When I enter invalid "input" in search box
# Then I see the "No results" screen


Feature: Locating Neiman Marcus stores and viewing shop details
@common
Scenario: As a NM app user I can search the products
 Given I am in Shop screen
 And I tap on the Search box 
 Then I see the keypad enabled
 When I enter valid "input" in search box
 Then I see Products <"Outcome"> with following details
 |Outcome|
 |Product Brand|
 |Product Name|
 |Price|
	