class Tag < ApplicationRecord
	has_many :TweetTags
	has_many :tweets, through: :TweetTags
end
