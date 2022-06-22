class CreatePagesForSpreeProducts < ActiveRecord::Migration[5.2]
  def up
    site_id = Comfy::Cms::Site.find_by!(identifier: 'rhea').id
    layout_id = Comfy::Cms::Layout.find_by!(label: 'Product').id
    parent_id = Comfy::Cms::Page.find_by!(label: 'Products').id
    

    Spree::Product.all.each do |p|
      if Comfy::Cms::Page.find_by(slug: p[:slug]).blank?
        page = Comfy::Cms::Page.create(
          site_id: site_id,
          parent_id: parent_id,
          layout_id: layout_id,
          label: p[:name],
          slug: p[:slug]
        )
  
        page.product = p
        page.save!
      end

    end
  end

  def down
    Spree::Product.all.each do |p|
      Comfy::Cms::Page.find_by(slug: p[:slug])&.delete
    end
  end
end
