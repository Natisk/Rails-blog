ActiveAdmin.register Post do

  scope :unapproved

  form do |f|
   f.inputs 'Post' do
     f.input :title
     f.input :body
     f.input :status
     f.input :explanation
     f.input :data
   end
   f.inputs 'Tags' do
     f.semantic_fields_for :tags do |j|
       j.inputs :tag_word
     end
   end
=begin
 f.inputs 'Tag' do
   f.fields_for :tags, @post.tags.empty? ? @tag : @post.tags do |tag_field|
     tag_field.text_field :tag_word, :class=>'field_tag'
   end
 end
=end
   f.actions
  end
end                                   
