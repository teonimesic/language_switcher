module LanguageSwitcher
  def attribute_translation(object_name, field, default='', interpolation={})
    I18n.t field, interpolation.merge({:scope => [:activerecord, :attributes, object_name], :default => default})
  end

  def each_language
    I18n.available_locales.each do |l|
      language(l){ yield l }
    end
  end

  def language(l)
    current = I18n.locale
    if I18n.available_locales.include? l
      I18n.locale = l
      yield
      I18n.locale = current
    else
      raise "I18n.available_locales does not contain #{l}"
    end
  end

  def t(key, interpolations={})
    begin
      I18n.translate!(key, interpolations.merge({:scope => [:views, :defaults]}) )
    rescue
      I18n.translate!(key, interpolations.merge({:scope => [:views, controller_name]}) )
    end
  end  
end

module LanguageSwitcher::Helpers
  include LanguageSwitcher

  def language_switcher(&block)
    content_tag("div", content_tag("ul", language_nav) << language_tabs(&block), 'data-tabs'=>'data-tabs' )
  end
  
  def language_tabs(&block)
    I18n.available_locales.inject("".html_safe) do |html, lang|
      html << language_tab(lang, &block)
    end
  end
  
  def language_tab(lang, &block)
    content_tag("div", :id=>"language_#{lang}") do
      language(lang) do
        block.call lang
      end
    end
  end
  
  def language_nav
    I18n.available_locales.inject("".html_safe) do |html, lang|
      html << content_tag("li", link_to(t(lang), "#language_#{lang}") )
    end
  end
end

ActiveRecord::Base.send :extend, LanguageSwitcher
