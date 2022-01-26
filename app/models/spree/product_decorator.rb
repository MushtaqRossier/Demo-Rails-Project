# frozen_string_literal: true
 
Spree::Product.class_eval do
    has_one :page, class_name: 'Comfy::Cms::Page'
  end