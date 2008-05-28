require File.dirname(__FILE__) + '/spec_helper.rb'

describe Forms do
  
  before :all do
    @browser = IE.new
  end

  before :each do
    @browser.goto(TEST_HOST + "/forms_with_input_elements.html")
  end

  describe "#length" do
    it "should return the number of forms in the container" do
      @browser.forms.length.should == 2
    end
  end
  
  describe "#[]n" do
    it "should provide access to the nth form" do
      @browser.forms[1].action.should == 'post_to_me'
      @browser.forms[1].attribute_value('method').should == 'post'     
    end
  end
  
  describe "#each" do
    it "should iterate through forms correctly" do
      @browser.forms.each_with_index do |f, index|
        f.name.should == @browser.form(:index, index+1).name
        f.id.should == @browser.form(:index, index+1).id
        f.class_name.should == @browser.form(:index, index+1).class_name
      end
    end
  end
  
  after :all do
    @browser.close
  end

end

