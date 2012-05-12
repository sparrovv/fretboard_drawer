require 'spec_helper'

describe FretboardDrawer::FretboardString do

  let(:sounds) { {} }
  subject { FretboardDrawer::FretboardString.new("e", 2, sounds) }

  describe "#structure" do
    context "when no sounds" do

      it "generate structure of string" do
        subject.structure.should == ["e", "|", "-"*5, '|', "-"*5, '|']
      end

    end

    context "when there is one sound" do
      let(:sounds) {  { 1 => "o" } }

      it "generate structure of string" do
        subject.structure.should == ["e", "|", "--o--", '|', "-"*5, '|']
      end

    end

    context "when there is 2 sound" do
      let(:sounds) {  { 1 => "o", 2 => "d#" } }

      it "generate structure of string" do
        subject.structure.should == ["e", "|", "--o--", '|', "-d#--", '|']
      end

    end
  end


end
