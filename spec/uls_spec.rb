require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Uls" do

  before :all do
    @browser = Browser.new(BROWSER_OPTIONS)
  end

  before :each do
    @browser.goto(HTML_DIR + "/non_control_elements.html")
  end

  describe "#length" do
    it "returns the number of uls" do
      @browser.uls.length.should == 2
    end
  end

  describe "#[]" do
    it "returns the ul at the given index" do
      @browser.uls[1].id.should == "navbar"
    end
  end

  describe "#each" do
    it "iterates through uls correctly" do
      @browser.uls.each_with_index do |ul, index|
        ul.name.should == @browser.ul(:index, index+1).name
        ul.id.should == @browser.ul(:index, index+1).id
        ul.value.should == @browser.ul(:index, index+1).value
      end
    end
  end

  after :all do
    @browser.close
  end

end

