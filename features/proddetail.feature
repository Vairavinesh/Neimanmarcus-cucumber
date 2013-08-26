Feature: Browsing products and viewing Product details of the shop

@common
Scenario: As a NM app user I can add the products to the shopping bag 
 Given I am in Product detail screen
 And I see Add to Shopping Bag button
 When I tap on Add to Shopping Bag button
 Then I should see the message "The Product has been successfully added to your bag"
 
@common
Scenario: As a NM app user I view more products & their details
 Given I am in Product detail screen
 And I scroll to view more products & their details
 When I tap on the product image
 Then I should see Product image in full view
 And I should see more images of product on scrolling/swiping
 And I see Back button
 When I tap on Back button
 Then I should see "Product detail" screen

@common
Scenario: As a NM app user I can create valid wishlist & add product to it 
 Given I am in Product detail screen
 And I see Add to wishlist button
 When I tap on Add to wishlist button
 Then I should see Wishlists in a pop up
 When I tap on Create new button
 And I enter <Valid input>
 When I tap on Add button
 Then I should see "<Wishlist name>"added
 |Valid input|Wishlist name|
 |Summer|Summer wishlist is added|
 When I tap on Add to Wish list button
 And I select the created wishlist name
 Then I should see product added to that wishlist 
 And I should see message "The product has been successfully added to the collection"
 
@ipad
Scenario Outline: As a NM app user I can view the product & their details 
 Given I am in Product list screen
 When I tap on any products 
 Then I should see "Product detail" screen
 And I see Product details on scrolling/swiping
 When I tap on the "<Dropdown>"
 Then I should see "<Options selected>"
 And I see <"buttons">
 |buttons|
 |Size guide|
 |More|
 When I tap on "Size guide" button
 Then I should see "Size guide" screen 
 And I tap outide the pop up
 Then I should see "Product detail" screen
 And I tap on "More" button
 Then I should see full description of the product in a pop up
 And I tap outide the pop up
 Then I should see "Product detail" screen
 And I see Promotional offers
 When I tap on Click for details link
 Then I should see Promotional offers detail screen in a pop up
 And I tap outide the pop up
 Then I should see "Product detail" screen
 
 Examples:
 |Dropdown|Options selected|
 |Choose Color|blue|
 |Choose Size|32|
 |Quantity|1|
 
@iphone
Scenario Outline: As a NM app user I can view the product & their details 
 Given I am in Product list screen
 When I tap on any products 
 Then I should see "Product detail" screen
 And I see Product details on scrolling/swiping
 When I tap on the "<Dropdown>"
 Then I should see "<Options selected>"
 And I see <"buttons">
 |buttons|
 |Size guide|
 |More|
 When I tap on "Size guide" button
 Then I should see "Size guide" screen 
 And I see Back button
 When I tap on Back button
 Then I should see "Product detail" screen
 And I tap on "More" button
 Then I should see full description of the product 
 And I see Back button
 When I tap on Back button
 Then I should see "Product detail" screen
 And I see Promotional offers
 When I tap on Click for details link
 Then I should see Promotional offers detail screen 
 And I see Back button
 When I tap on Back button
 Then I should see "Product detail" screen
 
 Examples:
 |Dropdown|Options selected|
 |Choose Color|blue|
 |Choose Size|32|
 |Quantity|1|
 
 
 @common
Scenario: User views product detail as label when there is single value for color, size and quantity
 Given I am in Product detail screen
 And I see color, size and quantity as label