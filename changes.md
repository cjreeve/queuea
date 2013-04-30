# QueueA Changes


#### Add tags to nuggets

* Add model and configure database to record tags  

    $ rails generate model tag name:string nugget:references  
    
      invoke  active_record  
      create    db/migrate/20130430112723_create_tags.rb  
      create    app/models/tag.rb  
      invoke    rspec  
      create      spec/models/tag_spec.rb  
      
    $ rake db:migrate

* Update app/modfel/nugget.rb  
      ...  
      has_many :tags
      accepts_nested_attributes_for :tags, :allow_destroy => :true,  
        :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }  
        
* Create folder/file: app/views/tags/_form.html.erb  

        <%= form.fields_for :tags do |tag_form| %>
          <div class="field">
            <%= tag_form.label :name, 'Tag:' %>
            <%= tag_form.text_field :name %>
          </div>
          <% unless tag_form.object.nil? || tag_form.object.new_record? %>
            <div class="field">
              <%= tag_form.label :_destroy, 'Remove:' %>
              <%= tag_form.check_box :_destroy %>
            </div>
          <% end %>
        <% end %>
        
* update app/views/nuggets/show.html.erb  

    <p>
      <b>Tags:</b>
      <%= @post.tags.map { |t| t.name }.join(", ") %>
    </p>






