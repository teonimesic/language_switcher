require_relative 'spec_helper'

include LanguageSwitcher
I18n.available_locales = [:pt, :en]

describe "LanguageSwitcher" do
  it "should be able to switch to a language" do
    language(:pt){ I18n.locale.should == :pt } 
    language(:en){ I18n.locale.should == :en } 
  end

  it "should not be able to switch to a language unless it is included in I18n.default_locales" do
    lambda { language(:es) }.should raise_error
  end

  it "should pass thought each locale in I18n in order" do
    i = 0
    each_language do |l|
      I18n.locale.should == I18n.available_locales[i]
      I18n.locale.should == l
      i+=1
    end
  end

  # TODO: Add language_switcher view specs
end
