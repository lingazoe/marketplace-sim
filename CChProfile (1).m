function user = CChProfile(user)

%---PROFILE DISPLAY---%

fprintf('\nYour Profile\n');
fprintf('Username: %s\n', user.Username);
fprintf('Type: %s\n', user.Type);
fprintf('Location: %s\n\n', user.Location);

%DEFAULT PREFERENCES IF NEW USER
fprintf('Your Preferences\n');
fprintf('Price Min: %d\n', user.Preferences.PriceMin);
fprintf('Price Max: %d\n', user.Preferences.PriceMax);
fprintf('Category: %s\n', user.Preferences.Category);
fprintf('Condition: %s\n', user.Preferences.Condition);
fprintf('Location: %s\n', user.Preferences.Location);

%------%

while true

option2 = input('\nWhat would you like to edit? (0 - Profile / 1 - Preferences / 2 - Go Back)');

if option2 == 0

    fprintf('Editing Profile...\n\n');

    username = input('Enter your username: ', 's');
    location = input('Enter your location: ', 's');

    user.Username = username;
    user.Location = location;

    fprintf('\nYour profile has been updated!');

elseif option2 == 1 %OPTION 1 WORKS / FIX IF NO PREFERENCES

    fprintf('Editing Preferences (leave blank to keep original)...\n\n');

    priceMin = input('Enter the minimum price: ');
    priceMax = input('Enter the maximum price: ');
    category = input('Enter the category: ', 's');
    condition = input('Enter the condition: ', 's');
    location = input('Enter the location: ', 's');

    if ~isempty(priceMin)
    user.Preferences.PriceMin = priceMin;
    end

    if ~isempty(priceMax)
    user.Preferences.PriceMax = priceMax;
    end

    if ~isempty(category)
    user.Preferences.Category = category;
    end

    if ~isempty(condition)
    user.Preferences.Condition = condition;
    end

    if ~isempty(location)
    user.Preferences.Location = location;
    end

    fprintf('\nYour preferences are updated!');

elseif option2 == 2

    fprintf('\nGoing back to Main Menu...')
    break

else
    fprintf('Invalid Input. Please try again\n\n');
end
end