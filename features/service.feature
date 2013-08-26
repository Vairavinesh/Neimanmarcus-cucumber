Feature: Locating Neiman Marcus stores and viewing store details
@common
Scenario: User views store details screen of the preferred store using iPhone/ipad device
#Services
	When I tap Services button
	#And if Services are not available
	#Then I see <Output5>
	#|Output5|
	#|There are no services found for this store message|
	When services are available
	#Then I See <Output6>
	#|Output6|
	#|Services displayed as list|
	And I see the following <"details"> in the service section
	|details|
	|Service name|
	|Location|
	|Working hours|
	|Phone number|
	And I tap on a service
	Then I see the <"service details"> screen
	|service details|
	|Service Timing|
	|Contact Information|
	|View Menu button|
	|Back button|
	#And I tap on Make Reservation button
	#Then I am redirected to an external web page
	When I tap on View Menu button
	#Then I view the details in a pop-up
	#Then I see the service detail screen in pop up
	And I tap outside the pop up
	#And I see services tab highlighted
	And I view more services by swiping or scrolling
	
	@common
	Scenario: User views store details screen of the preferred store using iPhone/ipad device on Sales Associates
	
	#Sales Associates
	When I tap Sales Associates button 
	#And if Associates are not available
	#Then I see <Output3>
	#|Output3|
	#|No associates found for the store message|
	#When Associates are available
	#Then I see <Output4>
	#|Output4|
	#|Associates displayed as list|
	#And I see the <Associate details>
	#|Associate details|
	#|Associate Name|
	#|Designation|
	#|Associate Location|
	#|Message icon|
	#|Chat icon|
	When I tap on Message icon
	#Then I see Message app launched
	#And I cancel/complete the action
	#And I see Sales Associates tab highlighted
	When I tap Chat icon
	#Then I see Facetime app launched
	#And I cancel/complete the action
	#And I see Sales Associates tab highlighted