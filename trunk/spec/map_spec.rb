require File.dirname(__FILE__) + '/spec_helper.rb'

describe Map do
  
  before :all do
    @browser = IE.new
  end

  before :each do
    @browser.goto(TEST_HOST + "/images.html")
  end

  # Exists method
  describe "#exist?" do
    it "should return true if the 'map' exists" do
      @browser.map(:id, "triangle_map").should exist
      @browser.map(:id, /triangle_map/).should exist
      @browser.map(:name, "triangle_map").should exist
      @browser.map(:name, /triangle_map/).should exist
      @browser.map(:index, 1).should exist
      @browser.map(:xpath, "//map[@id='triangle_map']").should exist
    end
    it "should return true if the element exists (default how = :id)" do
      @browser.map("triangle_map").should exist
    end
    it "should return false if the 'map' doesn't exist" do
      @browser.map(:id, "no_such_id").should_not exist
      @browser.map(:id, /no_such_id/).should_not exist
      @browser.map(:name, "no_such_id").should_not exist
      @browser.map(:name, /no_such_id/).should_not exist
      @browser.map(:index, 1337).should_not exist
      @browser.map(:xpath, "//map[@id='no_such_id']").should_not exist
    end
    it "should raise ArgumentError when 'what' argument is invalid" do
      lambda { @browser.map(:id, 3.14).exists? }.should raise_error(ArgumentError)
    end
    it "should raise MissingWayOfFindingObjectException when 'how' argument is invalid" do
      lambda { @browser.map(:no_such_how, 'some_value').exists? }.should raise_error(MissingWayOfFindingObjectException)
    end
  end
  
  # Attribute methods
  describe "#id" do
    it "should return the id attribute" do
      @browser.map(:index, 1).id.should == "triangle_map"
    end
    it "should return an empty string if the element exists and the attribute doesn't" do
      @browser.map(:index, 2).id.should == ''
    end
    it "should raise UnknownObjectException if the p doesn't exist" do
      lambda { @browser.map(:id, "no_such_id").id }.should raise_error(UnknownObjectException)
      lambda { @browser.map(:index, 1337).id }.should raise_error(UnknownObjectException)
    end
  end
  
  describe "#name" do
    it "should return the name attribute" do
      @browser.map(:index, 1).name.should == "triangle_map"
    end
    it "should return an empty string if the element exists and the attribute doesn't" do
      @browser.map(:index, 2).name.should == ''
    end
    it "should raise UnknownObjectException if the p doesn't exist" do
      lambda { @browser.map(:id, "no_such_id").name }.should raise_error(UnknownObjectException)
      lambda { @browser.map(:index, 1337).name }.should raise_error(UnknownObjectException)
    end
  end

  # Other
  describe "#to_s" do
    it "should return a human readable representation of the element" do
      @browser.map(:index, 1).to_s.should == "tag:          map\n" + 
                                      "  id:           triangle_map\n" +
                                      "  name:         triangle_map"
    end
    it "should raise UnknownObjectException if the p doesn't exist" do
      lambda { @browser.map(:xpath, "//map[@id='no_such_id']").to_s }.should raise_error( UnknownObjectException)
    end
  end
  
  after :all do
    @browser.close
  end

end