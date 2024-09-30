markovChain = require("./markov.lua")

local promt = "Biden"

print("Promt: " .. promt .."\n\nResult: \n".. markovChain(promt) .. "\n\n")
