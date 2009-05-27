require File.dirname(__FILE__) + '/spec_helper'

describe Array do
  
  describe "to html json" do
    before do
      @array = ["1,2", "2,1"]
    end
    
    it "should add to_html_json to array instances" do
      lambda { @array.to_html_json }.should_not raise_error
    end
    
    it "should call to_json" do
      ActiveSupport::JSON.should_receive(:encode).and_return ""
      @array.to_html_json
    end
    
    it "should replace all double with single quotes" do
      @array.to_html_json.should == "['1,2','2,1']"
    end
  end
  
  describe "combination" do
    it "should work for several arrays and parameters" do
      [1,2,3,4].combination(0).should == []
      [1,2,3,4].combination(1).should == [[1], [2], [3], [4]]
      [1,2,3,4].combination(2).should == [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]
      [1,2,3,4].combination(3).should == [[1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]
      [1,2,3,4].combination(4).should == [[1, 2, 3, 4]]
      [1,2,3,4].combination(5).should == []
    end
  end
  
  describe "combination plus reverse" do
    it "should work for any array" do
      [1,2,3,4].combination_plus_reverse.should ==
        [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4], [2, 1], [3, 1], [4, 1], [3, 2], [4, 2], [4, 3]]
    end
  end
end