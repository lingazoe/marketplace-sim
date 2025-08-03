function CChMatchingPreferences(listings, user)

%ORDER IS BASED ON NO OF MATCHES FOR EACH CATEGORY

%CHECK EACH LISTING FOR MATCHES 

%PREFERENCES ARE: PRICEMIN/MAX, CONDITION, LOCATION, ADD CATEGORY

sums = zeros(1, length(listings));

for i = 1:length(listings) %FIX ITEM NAME

    points = 0;
   
    %PRICE RANGE
     if (listings(i).Price >= user.Preferences.PriceMin) && (listings(i).Price <= user.Preferences.PriceMax)
        points = points + 4;
    end

    %CATEGORY
    
    if (strcmp(listings(i).Category, user.Preferences.Category) || isempty(user.Preferences.Category))
       points = points + 3;
    end

    %CONDITION
    if (strcmp(listings(i).Condition, user.Preferences.Condition) || isempty(user.Preferences.Condition))
       points = points + 2;
    end

    %LOCATION

    if (strcmp(listings(i).Location, user.Preferences.Location) || isempty(user.Preferences.Location))
        points = points + 1;
    end

    sums(i) = points;
end

%MOST POINTS GOES FIRST UNTIL END

%eg. sums = [0, 1, 3, 2]

[sortedList, listingIndex] = sort(sums, 'descend');

%INDEX IS listingIndex(i)

fprintf('\nHere are the best matches based on your preferences: \n\n')

for i = 1:length(sortedList)
    fprintf('Listing ID: %d\nItemName: %s\nPrice: %.1f\nCategory: %s\nCondition: %s\nLocation: %s\nSeller: %s\n\n', ...
    listingIndex(i), ...   
    listings(listingIndex(i)).ItemName, ...        
    listings(listingIndex(i)).Price, ...    
    listings(listingIndex(i)).Category, ...    
    listings(listingIndex(i)).Condition, ...       
    listings(listingIndex(i)).Location, ...   
    listings(listingIndex(i)).Seller.Username); 
end

end