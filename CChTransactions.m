function listings = CChTransactions(itemID, listings)

while true

transaction = input('Would you like to buy the item? (Y/N)', 's'); %REMEMBER TO EDIT ITEMNAME

if strcmp(transaction, 'Y')

    fprintf('%s has been purchased for $%.1f',listings(itemID).ItemName, listings(itemID).Price);
    listings(itemID) = [];
    break;

elseif strcmp(transaction, 'N')
    
    fprintf('Going back to View Menu...');
    break;
else
    fprintf('Invalid Input. Please try again...');
end
end

end