planet(mercury, rocky, 36).
planet(venus, rocky, 67).
planet(earth, rocky, 93).
planet(mars, rocky, 142).
planet(jupiter, gas_giant, 484).
planet(saturn, gas_giant, 886).
planet(uranus, ice_giant, 1782).
planet(neptune, ice_giant, 2793).

% Rules
rocky_planet(X) :- planet(X, rocky, _).
gas_giant(X) :- planet(X, gas_giant, _).
ice_giant(X) :- planet(X, ice_giant, _).
