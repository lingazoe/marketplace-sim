function listings = CChViewListings(listings, user)

%SORTING BASED ON SPEICIFC THINGS

%ONLY IN VIEW ALL LISTINGS

while true

fprintf('\n🍒 View Menu 🍒\n');
fprintf('0 - Custom Search\n'); %FINISHED, NOT TESTED
fprintf('1 - View Best Matching\n'); %FINISHED, NOT TESTED
fprintf('2 - View All Listings\n'); %FINISHED, NOT TESTED
fprintf('3 - Back\n'); 

option3 = input('\nWhat would you like to do?');

switch option3
    case 0 

    fprintf('Custom Search...\n\n')

    % USER INPUT FOR PRICE RANGE
    while true
        minPrice = input('Enter minimum price: ');
        maxPrice = input('Enter maximum price: ');
    
        if isnumeric(minPrice) && isnumeric(maxPrice)
            if minPrice <= maxPrice
                break;
            else
                disp('The minimum price cannot be higher than the maximum price, try again.');
            end
        else
            disp('Please enter numeric values.');
        end
    end

    % USER INPUT FOR CATEGORY
        category = input('Please enter the desired category (or leave blank): ', 's');

    % USER INPUT FOR LOCATION
        location = input('Enter the desired location (or leave blank): ', 's');

        while true
        
        option2 = input('Enter the filter mode (0 - Inclusive / 1 - Exclusive): ');

        if option2 == 0

            fprintf('Here are your desired listings:\n\n');

        for i = 1:length(listings) 

            if ((listings(i).Price >= minPrice) && (listings(i).Price <= maxPrice)) || ...
                (strcmp(listings(i).Location, location) || isempty(location)) || ...
                (strcmp(listings(i).Category, category) || isempty(category))

            fprintf('Listing ID: %d\nItemName: %s\nPrice: %.1f\nCategory: %s\nCondition: %s\nLocation: %s\nSeller: %s\n\n', ...
            i, ...   
            listings(i).ItemName, ...        
            listings(i).Price, ...       
            listings(i).Category, ...
            listings(i).Condition, ...       
            listings(i).Location, ...   
            listings(i).Seller.Username); 
            end
        end

        break;

        elseif option2 == 1

            fprintf('Here are your desired listings:\n\n');

            for i = 1:length(listings) 

            if ((listings(i).Price >= minPrice) && (listings(i).Price <= maxPrice)) && ...
                (strcmp(listings(i).Location, location) || isempty(location)) && ...
                (strcmp(listings(i).Category, category) || isempty(category))

            fprintf('Listing ID: %d\nItemName: %s\nPrice: %.1f\nCategory: %s\nCondition: %s\nLocation: %s\nSeller: %s\n\n', ...
            i, ...   
            listings(i).ItemName, ...        
            listings(i).Price, ...       
            listings(i).Category, ...
            listings(i).Condition, ...       
            listings(i).Location, ...   
            listings(i).Seller.Username); 
            end
            end

            break;

        else 
            fprintf('Invalid input. Please try again.');
        end

        end

        %TRANSACTION START
        while true
        choice = input('\nWould you like to buy any of these listings? (Y/N)', 's');

        if strcmp(choice, 'Y')
            itemID = input('Enter the Listing ID');
            listings = CChTransactions(itemID, listings);
        elseif strcmp(choice, 'N')
            break;
        else
            fprintf('Invalid Input. Please try again.');
        end
        end

    case 1
        %view matching w preferences HARDEST ONE

        %TRANSACTION START
        CChMatchingPreferences(listings, user);
        while true
        choice = input('\nWould you like to buy any of these listings? (Y/N)', 's');

        if strcmp(choice, 'Y')
            itemID = input('Enter the Listing ID');
            listings = CChTransactions(itemID, listings);
        elseif strcmp(choice, 'N')
            break;
        else
            fprintf('Invalid Input. Please try again.');
        end
        end

    case 2      

        while true
        option = input('Would you like to sort by price? (Y/N)', 's');

        if strcmp(option, 'Y')
            CChSorting(listings);
            break;

        elseif strcmp(option, 'N')
            fprintf('Here are all the listings:\n\n');

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
            break;
        else
            fprintf('Invalid Input. Please try again.\n\n');
        end
        end

        %TRANSACTION START

        while true
        choice = input('\nWould you like to buy any of these listings? (Y/N)', 's');

        if strcmp(choice, 'Y')
            itemID = input('Enter the Listing ID');
            listings = CChTransactions(itemID, listings);
        elseif strcmp(choice, 'N')
            break;
        else
            fprintf('Invalid Input. Please try again.');
        end
        end
           
    case 3
        fprintf('\nGoing back to Main Menu...')
        break;
    otherwise
        fprintf('Invalid Input. Please try again.');
end
end
end