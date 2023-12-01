% Facts about diet suggestions based on diseases
diet_suggestion(diabetes, 'Diabetes Diet Plan': ['Limit carbohydrates', 'Include fiber-rich foods', 'Choose whole grains', 'Monitor portion sizes']).
diet_suggestion(hypertension, 'Hypertension Diet Plan': ['Reduce sodium intake', 'Eat potassium-rich foods', 'Limit alcohol', 'Choose low-fat dairy']).

% Rule to get diet suggestion for a given disease
get_diet_suggestion(Disease, Suggestion) :-
    diet_suggestion(Disease, Suggestion).

% Example queries:
% 1. Get diet suggestion for diabetes
%    Query: get_diet_suggestion(diabetes, Suggestion).
%    Output: Suggestion = 'Diabetes Diet Plan': ['Limit carbohydrates', 'Include fiber-rich foods', 'Choose whole grains', 'Monitor portion sizes'].

% 2. Get diet suggestion for hypertension
%    Query: get_diet_suggestion(hypertension, Suggestion).
%    Output: Suggestion = 'Hypertension Diet Plan': ['Reduce sodium intake', 'Eat potassium-rich foods', 'Limit alcohol', 'Choose low-fat dairy'].
