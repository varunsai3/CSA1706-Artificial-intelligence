% Define initial state
initial_state(state(at_door, on_floor, at_window, has_not_reached_banana)).

% Define goal state
goal_state(state(at_center, on_box, at_window, has_reached_banana)).

% Define actions
action(go_door, state(at_window, on_floor, at_center, has_not_reached_banana), state(at_door, on_floor, at_center, has_not_reached_banana)).
action(go_window, state(at_door, on_floor, at_center, has_not_reached_banana), state(at_window, on_floor, at_center, has_not_reached_banana)).
action(go_box, state(at_center, on_floor, at_center, has_not_reached_banana), state(at_center, on_box, at_center, has_not_reached_banana)).
action(push_box, state(at_center, on_box, at_center, has_not_reached_banana), state(at_center, on_floor, at_center, has_not_reached_banana)).
action(climb_box, state(at_center, on_floor, at_center, has_not_reached_banana), state(at_center, on_box, at_center, has_not_reached_banana)).
action(grab_banana, state(at_center, on_box, at_center, has_not_reached_banana), state(at_center, on_box, at_center, has_reached_banana)).

% Define recursive predicate to check if a sequence of actions leads to the goal
achieves_goal(State, []) :- goal_state(State).
achieves_goal(State1, [Action | Rest]) :-
    action(Action, State1, State2),
    achieves_goal(State2, Rest).

% Define main predicate to find a solution
solve :-
    initial_state(InitialState),
    achieves_goal(InitialState, Solution),
    write('Solution: '), write(Solution).

% Example usage:
% ?- solve.
% Example initial state
% initial_state(state(at_door, on_floor, at_window, has_not_reached_banana)).
