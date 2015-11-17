class Wine < ActiveRecord::Base
    self.per_page = 3
    
    def self.search(query)
	where("title like?", "%#{query}%")
    end
end
