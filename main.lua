markovChain = require("./markov.lua")

local promt = "Lua"

print("Promt: " .. promt .."\n\nResult: \n".. markovChain(promt) .. "\n\n")
