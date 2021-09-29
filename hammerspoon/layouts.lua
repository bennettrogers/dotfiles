-- Define custom saved layouts
-- Location vars
local leftThird = {
    x = 0.00,
    y = 0.00,
    w = 0.33,
    h = 1.00
}
local rightTwoThirds = {
    x = 0.33,
    y = 0.00,
    w = 0.67,
    h = 1.00
}

-- App vars
local browserApp = hs.application.get("Google Chrome")
local terminalApp = hs.application.get("iTerm2")
local ideApp = hs.application.get("Code")

devLayout = {
    {browserApp, nil, nil, leftThird, nil, nil},
    {terminalApp, nil, nil, rightTwoThirds, nil, nil},
    {ideApp, nil, nil, rightTwoThirds, nil, nil},
}

