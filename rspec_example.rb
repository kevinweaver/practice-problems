class Example
  def run
    return "hello world"
  end
end

require 'rspec/autorun'
RSpec.describe Example do
  describe "it runs" do
    context "valid return" do
      let(:example){
        Example.new
      }

      it "prints output" do
        expect(example.run).to eq "hello world"
      end
    end
  end
end

#EXAMPLE Methods
=begin
 visit clearance_batch_path(clearance_batch_1)
 click_link("Price Sold")
 click_button 'Send'
 expect(page).to_not have_content("Please enter a valid email address")
 expect(page).to have_content("Sent!")
 expect(item_1.price_sold.to_s).to appear_before(item_2.price_sold.to_s)
 within('#total-price') do
   expect(page).to have_content(BigDecimal.new("55.55"))
   fill_in 'body', with: valid_email[:body]
   first('.send-report-dropdown').click_button("Send Report")
 end
=end
