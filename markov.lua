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

function comma_value(amount)
  local formatted = amount
  while true do  
    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
    if (k==0) then
      break
    end
  end
  return formatted
end

print("Total words: " .. comma_value(#text))
function chance()
    return math.random(1,100) ~= -1
end
function main(content)
    local question = content
    local answer = split(content," ")
    local AnswerString = content
    repeat
        question = answer[#answer]
        local answerPool = {}
        local found = false
        if #split(AnswerString," ")>=8 then -- I dont care about this shit
            for n,i in pairs(text) do
                if text[n-7] == answer[#answer-7] and text[n-6] == answer[#answer-6] and text[n-5] == answer[#answer-5] and text[n-4] == answer[#answer-4] and text[n-3] == answer[#answer-3] and text[n-2] == answer[#answer-2] and  text[n-1] == answer[#answer-1] and i == question and text[n+1] and text[n-1] and chance() then
                    if answerPool[text[n+1]] == nil then answerPool[text[n+1]] = 1 else answerPool[text[n+1]] = answerPool[text[n+1]] + 1 end
                    found = true
                end
            end
        end
        if not found and #split(AnswerString," ")>=7 then
            for n,i in pairs(text) do
                if text[n-6] == answer[#answer-6] and text[n-5] == answer[#answer-5] and text[n-4] == answer[#answer-4] and text[n-3] == answer[#answer-3] and text[n-2] == answer[#answer-2] and  text[n-1] == answer[#answer-1] and i == question and text[n+1] and text[n-1] and chance() then
                    if answerPool[text[n+1]] == nil then answerPool[text[n+1]] = 1 else answerPool[text[n+1]] = answerPool[text[n+1]] + 1 end
                    found = true
                end
            end
        end
        if not found and #split(AnswerString," ")>=6 then
            for n,i in pairs(text) do
                if text[n-5] == answer[#answer-5] and text[n-4] == answer[#answer-4] and text[n-3] == answer[#answer-3] and text[n-2] == answer[#answer-2] and  text[n-1] == answer[#answer-1] and i == question and text[n+1] and text[n-1] and chance() then
                    if answerPool[text[n+1]] == nil then answerPool[text[n+1]] = 1 else answerPool[text[n+1]] = answerPool[text[n+1]] + 1 end
                    found = true
                end
            end
        end
        if not found and #split(AnswerString," ")>=5 then
            for n,i in pairs(text) do
                if  text[n-4] == answer[#answer-4] and text[n-3] == answer[#answer-3] and text[n-2] == answer[#answer-2] and  text[n-1] == answer[#answer-1] and i == question and text[n+1] and text[n-1] and chance() then
                    if answerPool[text[n+1]] == nil then answerPool[text[n+1]] = 1 else answerPool[text[n+1]] = answerPool[text[n+1]] + 1 end
                    found = true
                end
            end
        end
        if not found and #split(AnswerString," ")>=4 then
            for n,i in pairs(text) do
                if  text[n-3] == answer[#answer-3] and text[n-2] == answer[#answer-2] and  text[n-1] == answer[#answer-1] and i == question and text[n+1] and text[n-1] and chance() then
                    if answerPool[text[n+1]] == nil then answerPool[text[n+1]] = 1 else answerPool[text[n+1]] = answerPool[text[n+1]] + 1 end
                    found = true
                end
            end
        end
        if not found and #split(AnswerString," ")>=3 then
            for n,i in pairs(text) do
                if text[n-2] == answer[#answer-2] and text[n-1] == answer[#answer-1] and i == question and text[n+1] and text[n-1] and chance() then
                    if answerPool[text[n+1]] == nil then answerPool[text[n+1]] = 1 else answerPool[text[n+1]] = answerPool[text[n+1]] + 1 end
                    found = true
                end
            end 
        end
        if not found and #split(AnswerString," ")>=2 then
            for n,i in pairs(text) do
                if text[n-1] == answer[#answer-1] and i == question and text[n+1] and text[n-1] and chance() then
                    if answerPool[text[n+1]] == nil then answerPool[text[n+1]] = 1 else answerPool[text[n+1]] = answerPool[text[n+1]] + 1 end
                    found = true
                end
            end 
        end
        if not found and #split(AnswerString," ")>=1 then
            for n,i in pairs(text) do
                if i == question and text[n+1] then
                    if answerPool[text[n+1]] == nil then answerPool[text[n+1]] = 1 else answerPool[text[n+1]] = answerPool[text[n+1]] + 1 end
                    found = true
                end
            end 
        end
        local maxChars = 999
        if not found then
            for i = #question-1, 1, -1 do
                for n,word in pairs(text) do
                    if #question <= #word then
                        if maxChars > i and string.sub(string.lower(word), i) == string.sub(string.lower(question), i) then
                            if answerPool[text[n+1]] == nil then answerPool[text[n+1]] = 1 else answerPool[text[n+1]] = answerPool[text[n+1]] + 1 end
                            maxChars = i
                            found = true
                        end
                    end
                end
            end
        end
        if found then
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
