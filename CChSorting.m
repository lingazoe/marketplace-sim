function CChSorting(listings)

    for i = 1:length(listings)
        
        lowestPrice = i; 
        
        for j = i+1:length(listings)
            
            %comparing prices
            if listings(j).Price < listings(lowestPrice).Price 
            lowestPrice = j;
            end
        end
    % Exchange elements

    temp = listings(i);
    listings(i) = listings(lowestPrice);
    listings(lowestPrice) = temp;


    end

    for i = 1:length(listings)
            fprintf('Listing ID: %d\nItem Name: %s\nPrice: %.1f\nCategory: %s\nCondition: %s\nLocation: %s\nSeller: %s\n\n', ...
            i, ...   
            listings(i).ItemName, ...        
            listings(i).Price, ...       
            listings(i).Category, ...
            listings(i).Condition, ...       
            listings(i).Location, ...   
            listings(i).Seller.Username); 
     end

end