function newListing = CChCreateListing(user)

fprintf('\nCreating a new listing...\n\n');

item = input('Item Name: ', 's');
price = input('Price: ');
category = input('Category: ', 's');
condition = input('Condition: ', 's');
location = input('Location: ', 's');

newListing = struct('ItemName', item, 'Price', price, 'Category', category, 'Condition', condition, 'Location', location, 'Seller', user);
end