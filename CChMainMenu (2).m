%---CURRENT VARIABLES---%

%USERS
ccUsers(1) = struct('Username', 'Sahar', 'Type', 'Seller', 'Location', 'Toronto', 'Preferences', struct('PriceMin', 0, 'PriceMax', 100, 'Category', 'Beauty', 'Condition', 'Good', 'Location', 'Toronto'));
ccUsers(2) = struct('Username', 'Jacky', 'Type', 'Seller', 'Location', 'Toronto', 'Preferences', struct('PriceMin', 10, 'PriceMax', 50, 'Category', 'Furniture', 'Condition', 'Excellent', 'Location', 'Toronto'));

%DEFAULT PREFERENCES

defaultPreferences = struct('PriceMin', 0, 'PriceMax', 1000, 'Category', '', 'Condition', '', 'Location', '');

%LISTINGS
ccListing(1) = struct('ItemName', 'Mascara', 'Price', 20, 'Category', 'Beauty', 'Condition', 'Good', 'Location', 'Toronto', 'Seller', ccUsers(1));
ccListing(2) = struct('ItemName', 'Lipstick', 'Price', 15, 'Category', 'Beauty', 'Condition', 'Excellent', 'Location', 'Montreal', 'Seller', ccUsers(1));
ccListing(3) = struct('ItemName', 'Sofa', 'Price', 100, 'Category', 'Furniture', 'Condition', 'Good', 'Location', 'Toronto', 'Seller', ccUsers(2));
ccListing(4) = struct('ItemName', 'Hanger', 'Price', 2, 'Category', 'Retail', 'Condition', 'Decent', 'Location', 'Toronto', 'Seller', ccUsers(2));

%---USER REGISTRATION/LOGIN---%

fprintf('Welcome to Cherry Charm Marketplace! Please register below\n\n');

username = input('Enter your username: ', 's');

location = input('Enter your location: ', 's');

while true

type = input('Enter your user type (Buyer / Seller): ', 's');

if strcmp('Buyer', type) || strcmp('Seller', type)
    break;
else
    fprintf('Invalid input. Please try again.');
end

end

%id of current user
currentUser = length(ccUsers) + 1;
ccUsers(currentUser) = struct('Username', username, 'Type', type , 'Location', location, 'Preferences', defaultPreferences);

fprintf('\nYou have successfully registered!\n');

while true

%---CHERRY CHARM MAIN MENU---%

fprintf('\n\n🍒 CHERRY CHARM MAIN MENU 🍒\n\n');
fprintf('0 - Create Listing\n'); %FINISHED, NOT TESTED
fprintf('1 - View Listings\n'); %FINISHED, NOT TESTED
fprintf('2 - Manage Listings\n'); %FINISHED, NOT TESTED
fprintf('3 - User Profile\n'); %FINISHED, TESTED
fprintf('4 - Log out\n'); 

%------%

option = input('\nWhat would you like to do?');

switch option
    case 0 
        %create a listing, return struct ROUGH COMPLETED

        currentListing = length(ccListing) + 1;

        newListing = CChCreateListing(ccUsers(currentUser)); 
        ccListing(currentListing) = newListing;  

        fprintf('\nA new listing has been created!\n\n');
        fprintf('Listing ID: %d\nItem Name: %s\nPrice: %.1f\nCategory: %s\nCondition: %s\nLocation: %s\nSeller: %s\n', ...
            length(ccListing), ...   
            newListing.ItemName, ...        
            newListing.Price, ...       
            newListing.Category, ...
            newListing.Condition, ...       
            newListing.Location, ...   
            newListing.Seller.Username); 
    case 1
        ccListing = CChViewListings(ccListing, ccUsers(currentUser));
    case 2
        %edit/delete listings: another script, return listings
        ccListing = CChManageListings(ccListing, ccUsers(currentUser).Username);
    case 3
        %view profile: another script, return profile ROUGH COMPLETED
        ccUsers(currentUser) = CChProfile(ccUsers(currentUser));
    case 4
        fprintf('Logging out...');
        break;
    otherwise
        %unallowed input, try again
        fprintf('Invalid Input. Please try again.');
end
end
