module ApplicationHelper
	def hot_tags

			tweets = TweetTag.all
	    if tweets.length > 0 
	    	tag_arr =[]
		    tag_ids = []
		    count = 0
		   
		    	tags = TweetTag.all.group_by { |h| h['tag_id']}.to_a.sort_by{|x| x[1].length}
					count = 1
		   		3.times do 
		    		tag_ids.push(tags[tags.length-count][0])
		    		count +=1
		    	end	
		    end	

		   tag_ids.each do |phrase|
		   	tag_phrase = Tag.find(phrase)
		   	tag_arr.push(tag_phrase)
		   end	

		return tag_arr
	end

	def top_tweeter
    tweets = Tweet.all
    if tweets.length > 0
      user_id =  Tweet.all.group_by { |h| h['user_id']}.to_a.max_by {|x| x[1].length}.first 
      user = User.find(user_id)
      return user
    end

  end

  def top_number_tweets
  	tweets = Tweet.all
    if tweets.length > 0
      user_id =  Tweet.all.group_by { |h| h['user_id']}.to_a.max_by {|x| x[1].length}.first 
  

	    tweets = Tweet.where(user_id: user_id)
	   	return tweets.length
	  end 
	end	

	def current_user_followers
		followers = 0

    User.all.each do |user|
      followers += 1 if user.following.include?(current_user.id)
        
    end 
    return followers  
  end	

end
