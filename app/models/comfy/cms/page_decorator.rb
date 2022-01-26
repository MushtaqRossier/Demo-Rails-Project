# frozen_string_literal: true
 
Comfy::Cms::Page.class_eval do
    belongs_to :product, class_name: 'Spree::Product'
  end