class Post < ActiveRecord::Base
	validates :title, presence: true,
	length: { minimum: 5 }

	has_many :comments, dependent: :destroy

	auto_html_for :text do
    	html_escape
    	image
    	youtube(:width => 400, :height => 250, :autoplay => true)
    	vimeo(:width => 400, :height => 250, :autoplay => true)
    	link :target => "_blank", :rel => "nofollow"
    	simple_format
  	end
end

