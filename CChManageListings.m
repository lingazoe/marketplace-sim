function listings = CChManageListings(listings, currentUsername)

listingCount = false;
fprintf('\nChecking for listings...\n\n');

for i = 1:length(listings) %FIX ITEM NAME

    if strcmp(currentUsername, listings(i).Seller.Username)
        fprintf('Listing ID: %d\nItem Name: %s\nPrice: %.1f\nCategory: %s\nCondition: %s\nLocation: %s\nSeller: %s\n\n', ...
            i, ...   
            listings(i).ItemName, ...        
            listings(i).Price, ...       
            listings(i).Category, ...
            listings(i).Condition, ...       
            listings(i).Location, ...   
            listings(i).Seller.Username); 

        listingCount = true;
    end
end

if ~listingCount
    fprintf('You have no listings. Going back to View Menu...');
    return;
end

while true

choice2 = input('Would you like to edit or delete a listing? (0 - Edit / 1 - Delete / 2 - Go Back)');

if choice2 == 1
    option = input('Please enter the Item ID');
    fprintf('This item is now deleted\n\n')
    listings(option) = [];

elseif choice2 == 0
    option = input('Please enter the Item ID');

    fprintf('Editing a current listing...(leave blank to keep original)\n\n');
    %OPTIONS CAN BE LEFT BLANK

    item = input('Enter Item Name (or leave blank): ', 's');
    if ~isempty(item)
        listings(option).ItemName = item;
    end
    price = input('Price (input -1 to keep original): ');

    if price ~= -1
        listings(option).Price = price;
    end

    category = input('Category (or leave blank): ');

    if ~isempty(category)
        listings(option).Category = category;
    end

    condition = input('Condition (or leave blank): ', 's');

    if ~isempty(condition)
        listings(option).Condition = condition;
    end

    location = input('Location (or leave blank): ', 's');

    if ~isempty(location)
        listings(option).Location = location;
    end

    fprintf('Your listing has been updated! See below: \n\n');

    fprintf('Listing ID: %d\nItem Name: %s\nPrice: %.1f\nCategory: %s\nCondition: %s\nLocation: %s\nSeller: %s\n', ...
            option, ...   
            listings(option).ItemName, ...        
            listings(option).Price, ...       
            listings(option).Category, ...
            listings(option).Condition, ...       
            listings(option).Location, ...   
            listings(option).Seller.Username); 

elseif choice2 == 2

    fprintf('\nGoing back to Main Menu...')
    break;

else
    fprintf('Invalid Input. Please try again\n\n');
end
end
