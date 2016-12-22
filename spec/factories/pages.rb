# == Schema Information
#
# Table name: pages
#
#  id                 :integer          not null, primary key
#  title              :string(255)      not null
#  short_title        :string(255)
#  slug               :string(255)      not null
#  redirect_to        :string(255)
#  copy               :text
#  copy_top           :text
#  meta_description   :text
#  status_id          :integer          default(1)
#  order              :integer          default(1)
#  locked             :boolean          default(FALSE)
#  in_nav             :boolean          default(FALSE)
#  password_protected :boolean          default(FALSE)
#  created_at         :datetime
#  updated_at         :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    title nil
    slug nil
    short_title nil
    redirect_to ""
    copy '<p>Etiam iaculis nunc ac metus. Nulla neque dolor, sagittis eget, iaculis quis, molestie non, velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Praesent nonummy mi in odio. Aliquam eu nunc.</p></p>Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. Suspendisse nisl elit, rhoncus eget, elementum ac, condimentum eget, diam. Etiam feugiat lorem non metus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Morbi nec metus.</p></p>Fusce convallis metus id felis luctus adipiscing.. Nam adipiscing. Cras risus ipsum, faucibus ut, ullamcorper id, varius ac, leo. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.</p></p>Nam ipsum risus, rutrum vitae, vestibulum eu, molestie vel, lacus. Phasellus a est. Suspendisse eu ligula. Suspendisse feugiat. Suspendisse potenti.</p></p>Cras id dui. Cras dapibus. Vestibulum volutpat pretium libero. In ut quam vitae odio lacinia tincidunt. Nulla consequat massa quis enim.</p>'
    copy_top '<p>Etiam iaculis nunc ac metus. Nulla neque dolor, sagittis eget, iaculis quis, molestie non, velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Praesent nonummy mi in odio. Aliquam eu nunc.</p></p>Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. Suspendisse nisl elit, rhoncus eget, elementum ac, condimentum eget, diam. Etiam feugiat lorem non metus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Morbi nec metus.</p></p>Fusce convallis metus id felis luctus adipiscing.. Nam adipiscing. Cras risus ipsum, faucibus ut, ullamcorper id, varius ac, leo. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.</p></p>Nam ipsum risus, rutrum vitae, vestibulum eu, molestie vel, lacus. Phasellus a est. Suspendisse eu ligula. Suspendisse feugiat. Suspendisse potenti.</p></p>Cras id dui. Cras dapibus. Vestibulum volutpat pretium libero. In ut quam vitae odio lacinia tincidunt. Nulla consequat massa quis enim.</p>'
    meta_description nil
    order 1
    status_id 1
    locked false
    in_nav false
  end
end
