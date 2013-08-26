
=begin

# Given(/^I am in Home screen$/) do
  # if ENV['DEVICE'] == 'ipad'
     # on(Shop).hme_pge_popup("CONTINUE AS GUEST")
  # else
    # on(Shop).scrl_view('up')
    # on(Shop).hme_pge_popup("CONTINUE AS GUEST")
    # on(Shop).is_elm_prst('iphone_menu_btn')
    # on(Shop).clk_elm('iphone_menu_btn')
    # on(Shop).verify_home_page()
  # end
# end

When(/^I tap Account button$/) do
  on(Shop).is_elm_prst('home_acc_btn')
  on(Shop).clk_elm('home_acc_btn')
end

# When(/^I enter valid email address and password$/) do
  # wait_for_none_animating
# #  on(Shop).is_elm_prst('txt_box_eml')
  # on(Shop).entr_txt_email('txt_box_eml','txt_box_email_val')
# #  on(Shop).is_elm_prst('txt_box_pwd')
  # on(Shop).entr_txt_pwd('txt_box_pwd','txt_box_pwd_val')
# end

# And(/^I tap SIGN IN button$/) do
  # on(Shop).clk_elm('iph_signin_btn')
  # wait_for_none_animating
# end

# And(/^I see Account screen$/) do
  # on(Shop).is_elm_prst('acc_incrle_btn')
  # on(Shop).is_elm_prst('acc_edit_btn')
  # on(Shop).is_elm_prst('acc_log_out_btn')
# end

And(/^I see the following <"(.*?)">$/) do |test, table|
 on(Shop).is_tbl_elm_prst(test, table)
end

And(/^I see <"(.*?)">  button$/) do |arg1|
  on(Shop).is_elm_prst(arg)
  on(Shop).clk_elm(arg)
end

And(/^I see the below <"(.*?)">$/) do |test, table|
  on(Shop).is_tbl_elm_prst(test, table)
end

And(/^I see wish lists section$/) do
   on(Shop).is_elm_prst('acc_wish_list')
end

# When(/^I tap on Update Account button$/) do
  # on(Shop).is_elm_prst('upd_acc_btn')
  # on(Shop).clk_elm('upd_acc_btn')
# end


# Then(/^I see the following <"(.*?)">$/) do |test, table|
 # on(Shop).is_tbl_elm_prst(test, table)
# end

# When(/^I see the below <"(.*?)">$/) do |arg1, table|
  # on(Shop).is_tbl_elm_prst(test, table)
# end


# Then(/^I see <"(.*?)"> button$/) do |arg1|
 # on(Shop).is_elm_prst(arg1)
# end



Then(/^I enter a Old Password in Old Password field$/) do |arg1|
  on(Shop).entr_txt_data('txt_box_email_pwd')
end

Then(/^I enter a New password in New Password Field$/) do |arg1|
  on(Shop).entr_txt_data('txt_box_email_pwd')
end

Then(/^I enter the same New password in Confirm Password Field$/) do |arg1|
  
end

And(/^I see Log Out button$/) do
  on(Shop).is_elm_prst('acc_log_out_btn')
end

Then(/^I enter the incorrect New password in "Confirm password" Field$/) do
  on(Shop).entr_txt_data('txt_box_email_pwd')
end
  
And(/^I see "Password does not match. Please try again" message$/) do
  on(Shop).is_elm_prst('pwd_err_msg')
end
When(/^I tap Log out button$/) do
  on(Shop).clk_elm('acc_log_out_btn')
end

Then(/^I see Home screen$/) do
  on(Shop).clk_elm('iphone_menu_btn')
end

=end


# ----------------------Whish List Iteration8 Step Definition-------------------------
# ------------------------------------------------------------------------------------
Given(/^I am logged into Account screen$/) do
  if ENV['DEVICE'] == 'ipad'
    on(WishList).scrl_view('down')
    on(WishList).hme_pge_popup("CONTINUE AS GUEST")
    on(WishList).verify_home_page()
    on(WishList).is_elm_prst('home_acc_btn')
    on(WishList).clk_elm('home_acc_btn')
    wait_for_none_animating
    on(WishList).entr_txt_email('txt_box_eml','txt_box_email_val')
    on(WishList).entr_txt_pwd('txt_box_pwd','txt_box_pwd_val')
    on(WishList).clk_elm('iph_signin_btn')
    on(WishList).wait_for_ldg
  else
    on(WishList).scrl_view('up')
    on(WishList).hme_pge_popup("CONTINUE AS GUEST")
    on(WishList).is_elm_prst('lbl_menu_btn')
    on(WishList).clk_elm('lbl_menu_btn')
    on(WishList).verify_home_page()
    on(WishList).is_elm_prst('home_acc_btn')
    on(WishList).clk_elm('home_acc_btn')
    wait_for_none_animating
    on(WishList).entr_txt_email('txt_box_eml','txt_box_email_val')
    on(WishList).entr_txt_pwd('txt_box_pwd','txt_box_pwd_val')
    on(WishList).clk_elm('iph_signin_btn')
    on(WishList).wait_for_ldg
  end
end

And(/^I see profile information$/) do
  if ENV['DEVICE'] == 'ipad'
    on(WishList).profileinfo_verify_ipad
  else
  on(WishList).profileinfo_verify_iphone
  end  
end

And(/^I see account screen <"(.*?)">/) do |arg1, table|
  on(WishList).table_element_account(arg1, table)
end
When(/^I tap on "View Incircle Details" button$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).clk_elm('incl_viewincl_detail_ipad')
  else
  on(WishList).clk_elm('acc_incrle_btn')
  end
end

And(/^I see incircle <"(.*?)">/) do |arg1, table|
  on(WishList).table_element_account(arg1, table)
end

When(/^I tap on Add card button$/) do
  on(WishList).clk_elm('incl_add_card')
end
Then(/^I see add a new card screen$/) do
  on(WishList).is_elm_prst('incl_addcard_scr_copy')
  on(WishList).is_elm_prst('Back')
end

And(/^I enter details of the card$/) do
  on(WishList).entr_txt('card_number','incl_card_enter')
end

And(/^I see a pop up screen with <"(.*?)">$/) do |arg1, table|
  on(WishList).table_element_account(arg1, table)
end

Then(/^I see Incircle screen$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).is_elm_prst('acc_incl_scr_ipad')
  on(WishList).is_elm_prst('acc_incl_scr_earn_ipad')
  else
  on(WishList).is_elm_prst('acc_incl_screen')
  on(WishList).is_elm_prst('acc_incl_screen_points')
  end
end

Then(/^I see add a new card pop up$/) do
  on(WishList).is_elm_prst('incl_card_enter')
  on(WishList).is_elm_prst('incl_addcard_scr_copy')
end

Given(/^I am in Account screen$/) do
  if ENV['DEVICE'] == 'ipad'
    on(WishList).scrl_view('down')
    on(WishList).hme_pge_popup("ContinueGuestButton")
    on(WishList).verify_home_page()
    on(WishList).is_elm_prst('home_acc_btn')
    on(WishList).clk_elm('home_acc_btn')
    on(WishList).wait_for_ldg
    on(WishList).clear_field
    on(WishList).is_elm_prst('txt_box_eml')
    on(WishList).is_elm_prst('txt_box_pwd')
    on(WishList).is_elm_prst('iph_signin_btn')
    on(WishList).wait_for_ldg
  else
    on(WishList).scrl_view('up')
    on(WishList).hme_pge_popup("ContinueGuestButton")
    on(WishList).is_elm_prst('lbl_menu_btn')
    on(WishList).clk_elm('lbl_menu_btn')
    on(WishList).verify_home_page()
    on(WishList).is_elm_prst('home_acc_btn')
    on(WishList).clk_elm('home_acc_btn')
    on(WishList).wait_for_ldg
    on(WishList).clear_field
    on(WishList).is_elm_prst('txt_box_eml')
    on(WishList).is_elm_prst('txt_box_pwd')
    on(WishList).is_elm_prst('iph_signin_btn')
    on(WishList).wait_for_ldg
  end
end

When(/^I enter valid email address and password$/) do
  on(WishList).wait_for_ldg
  on(WishList).entr_txt_email('txt_box_eml','txt_box_email_val')
  on(WishList).entr_txt_pwd('txt_box_pwd','txt_box_pwd_val')
end

And(/^I tap SIGN IN button$/) do
  on(WishList).clk_elm('iph_signin_btn')
  on(WishList).wait_for_ldg
end

And(/^I see My Account screen$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).is_elm_prst('incl_viewincl_detail_ipad')
  on(WishList).is_elm_prst('incl_edit_info_ipad')
  on(WishList).is_elm_prst('incl_logout_ipad')
  else
  on(WishList).is_elm_prst('View Incircle Details')
  on(WishList).is_elm_prst('Update Account')
  on(WishList).is_elm_prst('acc_log_out_btn')
  end
end

When(/^I tap on Edit account info button$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).is_elm_prst('incl_edit_info_ipad')
  on(WishList).clk_elm('incl_edit_info_ipad')
  else
    on(WishList).is_elm_prst('Update Account')
    on(WishList).clk_elm('Update Account')
  end
end

And(/^I see the following <"(.*?)"> in Account screen$/) do |arg1, table|
  on(WishList).table_element_account(arg1, table)
end

When(/^I tap on "Add Card" button near Payment Method$/) do
  on(WishList).clk_elm('incl_add_card')
end

Then(/^I see the following <"(.*?)"> in Payment section$/) do |arg1, table|
  if ENV['DEVICE'] == 'ipad'
  on(WishList).table_element_account(arg1, table)
  else
   on(WishList).is_tbl_elm_prst_iphone(arg1, table)
  end
end

Then(/^I see the following <"(.*?)"> in Edit Acc Info section$/) do |arg1, table|
  if ENV['DEVICE'] == 'ipad'
  on(WishList).table_element_account(arg1, table)
  else
   on(WishList).is_tbl_elm_prst_lastiphone(arg1, table)
  end
end

Then(/^I see the following <"(.*?)"> in Edit Screen Section$/) do |arg1, table|
  if ENV['DEVICE'] == 'ipad'
  on(WishList).table_element_account(arg1, table)
  else
   on(WishList).is_tbl_elm_prst_lastiphone(arg1, table)
  end
end

And(/^I enter <"(.*?)">$/) do |arg1, table|
 on(WishList).enter_input_details(arg1, table)
end

When(/^I tap "Save" button$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).is_elm_prst('acc_edit_scr_upd_save')
  on(WishList).clk_elm('acc_edit_scr_upd_save')
  else
    on(WishList).is_elm_prst('acc_edit_scr_upd_save')
    on(WishList).is_elm_prst('acc_edit_scr_upd_save')
  end
end

# Then(/^I see "(.*?)" message$/) do |arg1|       #   Duplicate, its already available SD
  # on(WishList).verify_networkmsg(arg1)
# end


When(/^I tap on Edit button near Payment Method$/) do
  on(WishList).is_elm_prst('acc_update_edit')
  on(WishList).clk_elm('acc_update_edit')
end

And(/^I see Save button in account screen$/) do
  if ENV['DEVICE'] =='ipad'
  on(WishList).is_elm_prst('acc_update_save')
  else
    on(WishList).is_elm_prst('acc_edit_scr_upd_save')
  end
end

And(/^I see CANCEL button in account screen$/) do
  on(WishList).is_elm_prst('acc_edit_update_cancel')
end

Then(/^I see Account screen displayed with credit card details$/) do
  on(WishList).is_elm_prst('accupdate_card_payment_detail')
end

Then(/^I see the masked updated card number$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).verify_mask_value_ipad
  else
    on(WishList).verify_mask_value_iphone
  end
end

Then(/^I see BACK button in account screen$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).is_elm_prst('Back')
  else
    on(WishList).is_elm_prst('acc_edit_scr_back_iphone')
  end
end

When(/^I tap CANCEL button$/) do
  on(WishList).is_elm_prst('acc_edit_update_cancel')
  on(WishList).clk_elm('acc_edit_update_cancel')
end

Then(/^I see Account screen displayed without card details$/) do
  on(WishList).elemnt_not_exists('accupdate_card_payment_detail')
end

When(/^I tap BACK button$/) do
  on(WishList).is_elm_prst('acc_edit_scr_back_iphone')
  on(WishList).clk_elm('acc_edit_scr_back_iphone')
end

Then(/^I see Account information screen$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).is_elm_prst('acc_edit_info_prof_ipad')
  on(WishList).is_elm_prst('acc_edit_info_pass_ipad')
  on(WishList).is_elm_prst('acc_edit_info_sce_ipad')
  else
  on(WishList).is_elm_prst('acc_edit_scr_edit_ipad')
  on(WishList).is_elm_prst('acc_edit_info_prof_ipad')
  on(WishList).is_elm_prst('acc_edit_info_pass_ipad')
  end
end
Then(/^I see Edit Account information screen$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).is_elm_prst('acc_update_save')
  on(WishList).is_elm_prst('acc_edit_scr_edit_ipad')
  on(WishList).is_elm_prst('acc_edit_update_cancel')
  else
  on(WishList).is_elm_prst('acc_edit_scr_myacc_iphone')
  on(WishList).is_elm_prst('acc_edit_info_prof_ipad')
  on(WishList).is_elm_prst('acc_edit_info_pass_ipad')
  end
end

And(/^I see updated screen message as "(.*?)"$/) do |arg1|
  on(WishList).verify_networkmsg(arg1)
end

And(/^I tap OK button$/) do
  on(WishList).is_elm_prst('acc_edit_scr_upd_ok')
  on(WishList).clk_elm('acc_edit_scr_upd_ok')
end

When(/^I tap CLOSE button$/) do
   on(WishList).is_elm_prst('acc_edit_update_cancel')
   on(WishList).clk_elm('acc_edit_update_cancel')
end

#--------NAD 8 Iteration------------------

Given(/^I am in Home screen$/) do
  if ENV['DEVICE'] == 'ipad'
      on(WishList).hme_pge_navi("CONTINUE AS GUEST")
  else
    on(WishList).scrl_view('up')
    on(WishList).hme_pge_popup("CONTINUE AS GUEST")
    on(WishList).is_elm_prst('iphone_menu_btn')
    on(WishList).clk_elm('iphone_menu_btn')
    on(WishList).verify_home_page()
  end
end

When(/^I tap Account button$/) do
  on(WishList).is_elm_prst('home_acc_btn')
  on(WishList).clk_elm('home_acc_btn')
end

And(/^I see <"(.*?)">  button$/) do |arg|
  on(WishList).is_elm_prst(arg)
  on(WishList).clk_elm(arg)
end

And(/^I see the below <"(.*?)">$/) do |test, table|
     on(WishList).is_tbl_elm_prst(test, table)
end

And(/^I see wish lists section$/) do
   on(WishList).is_elm_prst('acc_wish_list')
   on(WishList).is_elm_prst('acc_wish_share')  
end

When(/^I tap on Edit account Information button$/) do
  if ENV['DEVICE'] == 'ipad'
     on(WishList).is_elm_prst('upd_acc_btn')
     on(WishList).clk_elm('upd_acc_btn')
  else
     on(WishList).is_elm_prst('iph_acc_edit_btn')
     on(WishList).clk_elm('iph_acc_edit_btn')
  end     
end

And(/^I see Save button$/) do
  #on(WishList).get_crd_crd_info
  if ENV['DEVICE'] == 'ipad'
     on(WishList).is_elm_prst('sav_btn')
  else
    on(WishList).is_elm_prst('iph_acc_sav_btn')
  end  
end  

And(/^I see Close button$/) do
on(WishList).is_elm_prst('can_cl_btn')
end

And(/^I see Back button$/) do
  on(WishList).is_elm_prst('iph_acc_bak_btn')
end

And(/^I tap Close button$/) do
  on(WishList).clk_elm('can_cl_btn')
end

Then(/^I see the following account <"(.*?)">$/) do |test, table|
   if ENV['DEVICE'] == 'ipad'
      on(WishList).is_tbl_elm_prst(test, table)
   else
      on(WishList).is_tbl_elm_prst_iphone(test, table)
   end     
end

Then(/^I see the following <"(.*?)"> under profile section$/) do |test, table|
  on(WishList).is_tbl_elm_prst(test, table)
end

# When(/^I see the below <"(.*?)">$/) do |arg1, table|
  # on(Shop).is_tbl_elm_prst(test, table)
# end


# Then(/^I see <"(.*?)"> button$/) do |arg1|
 # on(Shop).is_elm_prst(arg1)
# end



Then(/^I enter a Old Password in Old Password field$/) do 
  #on(Shop).entr_txt_data('txt_box_pwd_val')
  sleep 5
  on(WishList).inpt_txt_data('old_pwd_fld','txt_old_pwd' )
end

Then(/^I enter a valid Old Password in Old Password field$/) do 
on(WishList).inpt_txt_data('old_pwd_fld','txt_old_wrng_pwd' )
end

Then(/^I enter a New password in New Password Field$/) do 
  on(WishList).inpt_txt_data('new_pwd_fld','txt_new_pwd' )
end

Then(/^I enter the same New password in Confirm Password Field$/) do 
  on(WishList).inpt_txt_data('con_pwd_fld','txt_con_pwd' )
end

And(/^I see Log Out button$/) do 
  on(WishList).is_elm_prst('iph_acc_log_out_btn')
end

Then(/^I enter the incorrect New password in Confirm password Field$/) do
  on(WishList).inpt_txt_data('con_pwd_fld','txt_wrng_pwd' ) 
end
  
And(/^I see "Password does not match. Please try again." error message$/) do
  if ENV['DEVICE'] == 'ipad'
     on(WishList).clk_elm('sav_btn')
     on(WishList).is_elm_prst('pwd_err_msg')
     on(WishList).clk_elm('strs_popup_ok_btn')
  else
     on(WishList).clk_elm('iph_acc_sav_btn')
     on(WishList).is_elm_prst('pwd_err_msg')
     on(WishList).clk_elm('strs_popup_ok_btn')
  end  
end
When(/^I tap Log out button$/) do
  on(WishList).clk_elm('iph_acc_log_out_btn')
end

Then(/^I see Home screen$/) do
  on(WishList).elemnt_not_exists('iph_acc_log_out_btn')
   on(WishList).elemnt_not_exists('iph_acc_incrle_btn')
end

And(/^I tap Save button$/) do
  if ENV['DEVICE'] == 'ipad'
    on(WishList).clk_elm('sav_btn')
  else
    on(WishList).clk_elm('iph_acc_sav_btn')
  end      
end

And(/^I Change a name in First name field$/) do
  set_text("textField index:0","")
  set_text("textField index:1","")
  set_text("textField index:2","")
  on(WishList).inpt_txt_data('myacc_txt_box_fname', 'myacc_txt_box_fname_val' )
end

Then(/^I Change a name in Last name field$/) do
  if ENV['DEVICE'] == 'ipad'
     on(WishList).inpt_txt_data('myacc_lastname', 'myacc_lname_val' )
  else
     on(WishList).inpt_txt_data('myacc_lastname_iphone', 'myacc_lname_val' )
  end     
end

And(/^I change address in Shipping address field$/) do
  on(WishList).inpt_txt_data('myacc_txt_box_shp_add','shp_add_val' ) 
end

Then(/^I see message as Account information has been updated successfully$/) do
  on(WishList).is_elm_prst('myacc_sucess_msg')
end
# And(/^I tap OK button$/) do
  # on(Shop).clk_elm('strs_popup_ok_btn')
# end

And(/^I change security question$/) do
  if ENV['DEVICE'] == 'ipad'
     on(WishList).clk_elm('sec_quest')
     sleep 3
     on(WishList).tap_done_btn()
  else
#    scroll("view", :down)
    wait_for_none_animating
     on(WishList).clk_elm('SecurityQstion')
     sleep 2
     on(WishList).tap_done_btn()
  end      
end

And(/^I change security answer$/) do
  on(WishList).inpt_txt_data('txt_ans_fld','txt_ans_val' )
end

And(/^I see My ACCOUNT screen displayed with credit card details$/)  do
 on(WishList).is_elm_prst('acc_pay_mthd')
end

And(/^I see the masked card number$/)  do
   element_exists("label text:'$payment_mthd}'")
end

And(/^I enter values for credit card <"(.*?)">$/)  do |arg1, table|
     $crdt_card_type = query("label", :text)[59]
     puts $crdt_card_type
     $crdt_card_no = query("label", :text)[60]
     puts $crdt_card_no
   on(WishList).verify_creditcard_detail(arg1, table)
  # on(Shop).collect_cc_details()
end

Then(/^I see message as "Security answer does not match with the answer on the profile. Please try again"$/)  do
  on(WishList).is_elm_prst('$sucess_msg')
end

When(/^I tap on No Thanks button$/) do
     on(WishList).is_elm_prst('incl_Nothanks_btn')
     on(WishList).clk_elm('incl_Nothanks_btn')
end


Then(/^I see "(.*?)" message$/) do |arg1|
  on(WishList).verify_networkmsg(arg1)
end
=begin

  # -------------------- In-Circle Iteration 9 Feature Step Definition ----------------------
  # -----------------------------------------------------------------------

Given(/^I am in Home screen$/) do
  if ENV['DEVICE'] == 'ipad'
     on(WishList).scrl_view('down')
     on(WishList).hme_pge_popup("CONTINUE AS GUEST")
  else
    on(WishList).scrl_view('up')
    on(WishList).hme_pge_popup("CONTINUE AS GUEST")
    on(WishList).is_elm_prst('lbl_menu_btn')
    on(WishList).clk_elm('lbl_menu_btn')
    on(WishList).verify_home_page()
  end
end

When(/^I tap In\-Circle Tab$/) do
    on(WishList).is_elm_prst('lbl_home_incircle')
    on(WishList).clk_elm('lbl_home_incircle')
end

And(/^I am not logged into the app$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).is_elm_prst('incl_home_popup_addcard')
  on(WishList).is_elm_prst('incl_home_popup_nothanks')
  else
    on(WishList).verifytabs_iphone
  end
end

Then(/^I see circle tabs$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).incircle_tabs_verify
  else
   on(WishList).verifytabs_iphone
  end
end

And(/^I tap on the circle tabs$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).incircle_tabs_click
  else
    on(WishList).click_incircle_tabs_iphone
  end
end

And(/^I see Circle benefit content$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).verify_benifit
  else
  end
end

And(/^I see View Full site button$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).clk_elm('incl_scr_circletabone')
  on(WishList).scroll_screen('up')
  on(WishList).is_elm_prst('incl_view_full_site_ipad')
  else
    on(WishList).clk_elm('lbl_incl_tab_iphone')
    on(WishList).verify_view_full_site_iphone
  end
end

When(/^I tap on View Full site button$/) do
  if ENV['DEVICE'] == 'ipad'
    on(WishList).clk_elm('incl_view_full_site_ipad')
  else
    on(WishList).clk_elm('lbl_iphone_view_full_site')
  end
end

Then(/^I see In\-Circle Program tutorial$/) do
  on(WishList).is_elm_prst('lbl_home_incl_pgm_tutorial')
end

And(/^I am logged into the app$/) do
  if ENV['DEVICE'] == 'ipad'
    on(WishList).clk_elm('home_acc_btn')
    on(WishList).wait_for_ldg
    on(WishList).entr_txt_email('txt_box_eml','txt_box_email_val')
    on(WishList).entr_txt_pwd('txt_box_pwd','txt_box_pwd_val')
    on(WishList).is_elm_prst('iph_signin_btn')
    on(WishList).clk_elm('iph_signin_btn')
    on(WishList).wait_for_ldg
    on(WishList).clk_elm('lbl_home_incircle')
  else
    on(WishList).clk_elm('lbl_menu_btn')
    on(WishList).is_elm_prst('home_acc_btn')
    on(WishList).clk_elm('home_acc_btn')
    on(WishList).wait_for_ldg
    on(WishList).entr_txt_email('txt_box_eml','txt_box_email_val')
    on(WishList).entr_txt_pwd('txt_box_pwd','txt_box_pwd_val')
    on(WishList).is_elm_prst('iph_signin_btn')
    on(WishList).clk_elm('iph_signin_btn')
    on(WishList).wait_for_ldg
    on(WishList).clk_elm('lbl_menu_btn')
    on(WishList).wait_for_ldg
    on(WishList).clk_elm('lbl_home_incircle')
  end
end

Then(/^I see list of gift\/perk cards$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).view_gift_perk_cards
  else
   on(WishList).scrol_scrn_dwn
   on(WishList).scrol_scrn_dwn
   on(WishList).view_gift_perk_cards
  end
end

And(/^I scroll to view more gift\/perk cards$/) do
  on(WishList).scrl_view("down")
  on(WishList).scrl_view("up")
end

And(/^I tap on the card image$/) do
  on(WishList).is_elm_prst('incl_perk_card_img')
  on(WishList).clk_elm('incl_perk_card_img')
end

And(/^I see the following <"(.*?)"> in a pop up$/) do |arg1, table|
  if ENV['DEVICE'] =='ipad'
 on(WishList).table_element_account(arg1, table)
 else
   on(WishList).table_element_text(arg1, table)
 end
end

And(/^I see the <"(.*?)">$/) do |arg1, table|
  if ENV['DEVICE'] == 'ipad'
  on(WishList).table_element_account(arg1, table)
  else
    on(WishList).is_elm_prst('incl_perk_iphone_copy')
    on(WishList).is_elm_prst('incl_perk_popup_back')
  end
end

When(/^I tap Copy button$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).is_elm_prst('incl_perk_detail_copy')
  on(WishList).clk_elm('incl_perk_detail_copy')
  else
  on(WishList).is_elm_prst('incl_perk_iphone_copy')
  on(WishList).clk_elm('incl_perk_iphone_copy')
  end
end

Then(/^I see the card number copied in clipboard$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).is_elm_prst('incl_perk_copy_value')
  on(WishList).clk_elm('incl_perk_copy_value')
  else
  on(WishList).is_elm_prst('incl_perk_clipboard_iphone')
  on(WishList).clk_elm('incl_perk_clipboard_iphone')
  end
end

When(/^I tap Done button$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).is_elm_prst('incl_perk_detail_done')
  on(WishList).clk_elm('incl_perk_detail_done')
  else
  on(WishList).is_elm_prst('incl_perk_popup_back')
  on(WishList).clk_elm('incl_perk_popup_back')
  end
end

Then(/^I see the pop up closed$/) do
  on(WishList).view_gift_perk_cards
end
      #-----NAD SD's Iteration9

When(/^I tap No Thanks button$/) do
  on(WishList).clk_elm('incle_popup_no_thnk_btn')
end

Then(/^I see Circle Information screen$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).view_gift_perk_cards
  else
   on(WishList).scrol_scrn_dwn
   on(WishList).scrol_scrn_dwn
   on(WishList).view_gift_perk_cards
  end
end

Then(/^I see a pop up Access account page to update your NM or BG Card$/) do
  on(WishList).is_elm_prst('incrle_popup')
end

And(/^I see popup <"(.*?)">$/) do |arg1, table|
  on(WishList).table_element_account(arg1, table)
end

      # ------Fazil Iteration 9

When(/^I tap Add card button$/) do
  on(WishList).clk_elm_scr_value('Add_card_btn')
end

Then(/^I see Card details pop up$/) do
  on(WishList).is_elm_prst('card_tittle')
end

And(/^I see Incircle screen$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).is_elm_prst('incl_scr_title_ipad')
  on(WishList).is_elm_prst('incl_scr_learn_ipad')
  on(WishList).is_elm_prst('incl_scr_earned_ipad')
  else
  on(WishList).is_elm_prst('incl_circle_title_iphone')
  on(WishList).scrol_scrn_dwn
  on(WishList).is_elm_prst('incl_circle_learn_iphone')
  end
end

Then(/^I see point details associated to the card$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).is_elm_prst('Earned_gifts')
  else
    on(WishList).is_elm_prst('incl_cir_earned_iphone')
    on(WishList).scrol_scrn_up
  end
end

Then(/^I see Account status and circle level information$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).is_elm_prst('incl_circle_level_info')
  else
    on(WishList).is_elm_prst('incl_cir_pointaway_iphone')
  end
end

And(/^I see the following in landing <"(.*?)">$/) do |arg1, table|
  if ENV['DEVICE'] == 'ipad'
  on(WishList).scrol_scrn_dwn
  on(WishList).is_tbl_elm_prst(arg1, table)
  else
   on(WishList).scrol_scrn_dwn
   on(WishList).verify_learn_page_iphone
   end
end

And(/^I see  incircle <"(.*?)">$/) do |arg1, table|
  if ENV['DEVICE'] == 'ipad'
  on(WishList).is_tbl_elm_prst(arg1, table)
  else
    on(WishList).scrol_scrn_dwn
    on(WishList).verify_incl_scr_table
  end
end

When(/^I tap Learn More button$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).clk_elm('incl_scr_learn_ipad')
  else
    on(WishList).clk_elm('incl_cir_learn_iphone')
  end
end

Then(/^I see Generic information about the circle$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).wait_for_ldg
  on(WishList).incircle_tabs_verify
  else
    on(WishList).wait_for_ldg
    on(WishList).is_elm_prst('incl_learn_page_iphone')
  end
end

When(/^I tap View Full site$/) do
  if ENV['DEVICE'] == 'ipad'
  on(WishList).scrol_scrn_dwn
  on(WishList).clk_elm('incl_circle_view_full')
  else
    on(WishList).view_full_site_iphone_learn
  end
end

Then(/^I get redirected to the external Browser$/) do
  on(WishList).is_elm_prst('validate_url')
end

And(/^I relaunch the app to view the same screen$/) do
  on(WishList).is_elm_prst('incrle_mnu_circl_one')
end

Then(/^I see there are no gift\/perk cards$/) do
   on(WishList).scrol_scrn_dwn
   on(WishList).scrol_scrn_dwn
  on(WishList).gift_perk_cards_not_present
end

And(/^I see "(.*?)"$/) do |arg1|
  on(WishList).verify_networkmsg(arg1)
end

=end
