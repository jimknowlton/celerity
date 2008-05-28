require File.dirname(__FILE__) + '/spec_helper.rb'

describe TableFooters do
  
  before :all do
    @browser = IE.new
  end

  before :each do
    @browser = IE.new
    @browser.goto(TEST_HOST + "/tables.html")
  end
  
  describe "#length" do
    it "should return the correct number of table tfoots (page context)" do
      @browser.tfoots.length.should == 1
    end
    it "should return the correct number of table tfoots (table context)" do
      @browser.table(:index, 1).tfoots.length.should == 1
    end
  end
  
  describe "#[]" do
    it "should return the row at the given index (page context)" do
      @browser.tfoots[1].id.should == "tax_totals"
    end
    it "should return the row at the given index (table context)" do
      @browser.table(:index, 1).tfoots[1].id.should == "tax_totals"
    end
  end
  
  describe "#each" do
      it "should iterate through table tfoots correctly (page context)" do
        @browser.tfoots.each_with_index do |tfoot, index|
          tfoot.name.should == @browser.tfoot(:index, index+1).name
          tfoot.id.should == @browser.tfoot(:index, index+1).id
        end
      end    
      it "should iterate through table tfoots correctly (table context)" do
        table = @browser.table(:index, 1)
        table.tfoots.each_with_index do |tfoot, index|
          tfoot.name.should == table.tfoot(:index, index+1).name
          tfoot.id.should == table.tfoot(:index, index+1).id
        end
      end      
    end
  
  after :all do
    @browser.close
  end
  
end
