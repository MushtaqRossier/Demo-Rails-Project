class UpdateProductFields < ActiveRecord::Migration[5.2]
  def up
    Comfy::Cms::Layout.find_by!(label: 'Product').update(
      content: '{{ cms:textarea meta_description }}{{cms:wysiwyg related_items_heading}}'
    )  
  end

  def down
    Comfy::Cms::Layout.find_by!(label: 'Product').update(
      content: '{{ cms:textarea meta_description }}{{cms:wysiwyg related_items_heading}}'
    )  
  end
end
