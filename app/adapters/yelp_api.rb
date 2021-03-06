class YelpApi


    def self.client

      @client = Yelp.client

    end

    def self.search(params)
       results = client.search(params[:search][:location],params[:search][:yelp_key] )
       results.businesses.map do |result|
         Business.create({
           name: result.name,
           address: result.location.address.join(", "),
           rating: result.rating})
       end
   end
end

#Dealing with APIs:

      # get the API /its entire data (normally an object, hash)
      # turn whatever data you're obtaining from yelp (API) into ActiveRecord objects/instances
      # map through it to make them instances

#Questions:
  #how to prevent duplicates and still update the rating and other things that may change over time.
