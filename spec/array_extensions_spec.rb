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
      @array.should_receive(:to_json).and_return ""
      @array.to_html_json
    end
    
    it "should replace all double with single quotes" do
      @array.to_html_json.should == "['1,2', '2,1']"
    end
  end
end