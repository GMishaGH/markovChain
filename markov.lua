function split (inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end
local path = "./textGen/texts.txt"
local f = io.open(path,'r')
local FullText = f:read "*a"
f:close()
local text = string.gsub(FullText,"\n",". ")
text = split(text," ")

function chance()
    return math.random(1,25) ~= -1
end
function main(content)
    local iterations = 0
    local question = content
    local answer = split(content," ")
    local AnswerString = content
    local rank = 0
    local totalRank = 0
    repeat
        iterations = iterations + 1
        question = answer[#answer]
        local answerPool = {}
        local answerCount = 0
        if #split(AnswerString," ")>=8 then -- I dont care about this shit
            for n,i in pairs(text) do
                if text[n-7] == answer[#answer-7] and text[n-6] == answer[#answer-6] and text[n-5] == answer[#answer-5] and text[n-4] == answer[#answer-4] and text[n-3] == answer[#answer-3] and text[n-2] == answer[#answer-2] and  text[n-1] == answer[#answer-1] and i == question and text[n+1] and text[n-1] and chance() then
                    answerCount = answerCount + 1
                    if answerPool[text[n+1]] == nil then answerPool[text[n+1]] = 1 else answerPool[text[n+1]] = answerPool[text[n+1]] + 1 end
                    totalRank = totalRank + 1
                    rank = rank + 4
                end
            end
        elseif #split(AnswerString," ")>=7 then
            for n,i in pairs(text) do
                if text[n-6] == answer[#answer-6] and text[n-5] == answer[#answer-5] and text[n-4] == answer[#answer-4] and text[n-3] == answer[#answer-3] and text[n-2] == answer[#answer-2] and  text[n-1] == answer[#answer-1] and i == question and text[n+1] and text[n-1] and chance() then
                    answerCount = answerCount + 1
                    if answerPool[text[n+1]] == nil then answerPool[text[n+1]] = 1 else answerPool[text[n+1]] = answerPool[text[n+1]] + 1 end
                    totalRank = totalRank + 1
                    rank = rank + 4
                end
            end
        elseif #split(AnswerString," ")>=6 then
            for n,i in pairs(text) do
                if text[n-5] == answer[#answer-5] and text[n-4] == answer[#answer-4] and text[n-3] == answer[#answer-3] and text[n-2] == answer[#answer-2] and  text[n-1] == answer[#answer-1] and i == question and text[n+1] and text[n-1] and chance() then
                    answerCount = answerCount + 1
                    if answerPool[text[n+1]] == nil then answerPool[text[n+1]] = 1 else answerPool[text[n+1]] = answerPool[text[n+1]] + 1 end
                    totalRank = totalRank + 1
                    rank = rank + 4
                end
            end
        elseif #split(AnswerString," ")>=5 then
            for n,i in pairs(text) do
                if  text[n-4] == answer[#answer-4] and text[n-3] == answer[#answer-3] and text[n-2] == answer[#answer-2] and  text[n-1] == answer[#answer-1] and i == question and text[n+1] and text[n-1] and chance() then
                    answerCount = answerCount + 1
                    if answerPool[text[n+1]] == nil then answerPool[text[n+1]] = 1 else answerPool[text[n+1]] = answerPool[text[n+1]] + 1 end
                    totalRank = totalRank + 1
                    rank = rank + 4
                end
            end
        elseif  #split(AnswerString," ")>=4 then
            for n,i in pairs(text) do
                if  text[n-3] == answer[#answer-3] and text[n-2] == answer[#answer-2] and  text[n-1] == answer[#answer-1] and i == question and text[n+1] and text[n-1] and chance() then
                    answerCount = answerCount + 1
                    if answerPool[text[n+1]] == nil then answerPool[text[n+1]] = 1 else answerPool[text[n+1]] = answerPool[text[n+1]] + 1 end
                    totalRank = totalRank + 1
                    rank = rank + 4
                end
            end
        elseif #split(AnswerString," ")>=3 then
            for n,i in pairs(text) do
                if text[n-2] == answer[#answer-2] and text[n-1] == answer[#answer-1] and i == question and text[n+1] and text[n-1] and chance() then
                    answerCount = answerCount + 1
                    if answerPool[text[n+1]] == nil then answerPool[text[n+1]] = 1 else answerPool[text[n+1]] = answerPool[text[n+1]] + 1 end
                    totalRank = totalRank + 1
                    rank = rank + 3
                end
            end 
        elseif  #split(AnswerString," ")>=2 then
            if answerCount == 0 then
                for n,i in pairs(text) do
                    if #split(AnswerString," ")>=2 and  text[n-1] == answer[#answer-1] and i == question and text[n+1] and text[n-1] and chance() then
                        if answerPool[text[n+1]] == nil then answerPool[text[n+1]] = 1 else answerPool[text[n+1]] = answerPool[text[n+1]] + 1 end
                        answerCount = answerCount + 1
                        totalRank = totalRank + 1
                        rank = rank + 2
                    end
                end 
            end
        elseif  #split(AnswerString," ")>=1 then
            if answerCount == 0 then
                for n,i in pairs(text) do
                    if #split(AnswerString," ")>=1 and  i == question and text[n+1] then
                        if answerPool[text[n+1]] == nil then answerPool[text[n+1]] = 1 else answerPool[text[n+1]] = answerPool[text[n+1]] + 1 end
                        answerCount = answerCount + 1
                        totalRank = totalRank + 1
                        rank = rank + 1
                    end
                end 
            end
        end
        if  answerCount ~= 0 then
            local AnswerWord = ""
            for word,popular in pairs(answerPool) do
                if answerPool[AnswerWord] == nil or popular >= answerPool[AnswerWord] then 
                    AnswerWord = word
                end
            end
            table.insert(answer,AnswerWord)
            
            AnswerString = AnswerString .. " " .. AnswerWord
            question = AnswerWord
        else
            AnswerString = "."
        end
    until string.sub(AnswerString,-1) == "." 
    return AnswerString
end

return main
