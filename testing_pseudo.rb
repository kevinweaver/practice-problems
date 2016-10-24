describe 'SignUp' :feature do
  let(:third_party_biller) { FactoryGirl.build(:third_party_biller) }
  let(:third_party_client) { FactoryGirl.build(:third_party_client) }
  
  scenario 'A 3rd party biller signs up successfully', :js do
    click_button '3rd Party Biller'
    fill_in 'billing_registration', with: third_party_client.address_1
    fill_in 'city', with: third_party_client.city
    ...
    click_button 'Next'
    fill_in ...
    ...
    click_button 'Sign Up'
    expect(page).to have_content 'Account created successfully!'
    new_biller = User::Biller.order_by(:create_date).last
    expect(current_path).to eq new_biller
    expect(new_biller.attributes).to eq third_party_biller.attributes # GOOD
    expect(ob1 == ob2).to eq true #BAD
  end
  
  context 'with bad info' do
    let(:third_party_biller) { FactoryGirl.build(:third_party_biller, city: nil) }
    scenario 'A 3rd party biller signs up successfully', :js do
      click_button '3rd Party Biller'
      fill_in 'billing_registration', with: third_party_client.address_1
      fill_in 'city', with: third_party_client.city
      expect(page).to have_content 'Invalid City'
      ...
      click_button 'Next'
      fill_in ...
      ...
      click_button 'Sign Up'
      expect(page).to have_content 'Something went wrong...'
      new_biller = User::Biller.order_by(:create_date).last
      expect(current_path).to eq new_biller
      expect(new_biller.attributes).to eq third_party_biller.attributes # GOOD
      expect(ob1 == ob2).to eq true #BAD
    end
  end
  
end

#/spec/factories/billers

FactoryGirl.define do
  factory :third_party_client, class: Client do
    address_1 'Valid Address'
    ...
  end
  
  factory :user_biller, class: User::Biller do
    first_name 'Kevin'
    ...
  end
end
