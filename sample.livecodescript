script "LiveCode Sublime Text Language Module Example Stack"

global gGlobalVar # no variable assignemnt allowed for globals
global gGlobalVar2 -- just a variable for testing

local sLocalVar = true /* Default to true */
local sLocalVar2 = "a value"

constant kConstant = "red"
constant kConstant2 = "some value"

on libraryStack
  if the short name of the target is not me then pass libraryStack

  local tVar

  /* This is a
  multiline comment
  */

  put "The \ character is the " & \
        "line continuation character" into tVar

end libraryStack


command processParams
  local tVar

  put ($# - 1) into tVar
end processParams


setProp uCustomProp pValue
  put pValue into sLocalVar
end uCustomProp


setProp uCustomProp2[pCategory] pValue
  set the uCustomProp2[pCategory] of me to pValue

  # line continuation.
  # This:
  if "1" is 1 then \
        return "something"
  else \
        return "something else"

  # Is the same as this:
  if "1" is 1 then return "something"
  else return "something else"
end uCustomProp2


getProp myCustomProp
  return the myCustomProp2["test"] of me
end myCustomProp


getProp myCustomProp2 [pKey]
  return sLocalVar[pKey]
end myCustomProp2


function myFunction pParam1, @rParam2
  switch pParam1
    case "1"

      break
    case "2"

      break
    case 3

      break
    default
      return "test" for value
  end switch

  return myPrivateFunction(pParam1, rParam2)
end myFunction


command myCommand pParam
  local tError

  if 1 is "1" then return "nothing" # a comment

  myPrivateCommand pParam
  put the result into tError

  return tError for error
end myCommand


private function myPrivateFunction pParam1, @xParam2
  local tArray
  local i,j,x

  # with counterVar = startvalue to endvalue
  repeat with i = 1 to the number of elements of tArray
    if i = 1 then
      next repeat
    else
      exit repeat
    end if
  end repeat

  # with counterVar = startvalue to endvalue step x
  repeat with i = 1 to 20 step 2

  end repeat

  # with counterVar = startvalue down to endvalue
  repeat with i = 20 down to 10
    subtract 1 from j
  end repeat

  # repeat x times
  repeat 2 times
    add 1 to i
  end repeat

  # repeat forever
  repeat forever
    add 1 to i
    if i > 100 then exit repeat
  end repeat

  -- repeat while
  repeat while x < 2
    add 1 to x
  end repeat

  # repeat until
  put 0 into x
  repeat until x > 3
    add 1 to x
  end repeat

  local tList, tVar

  repeat for each item tItem in tList
    add 1 to x
  end repeat

  repeat for each key tKey in tArray
    put tKey & ":" && tArray[tKey] & cr after tVar
  end repeat

  repeat for each element tElement in tArray

  end repeat
end myPrivateFunction


private command myPrivateCommand pParam1
  local i

  if 1 is 1 then
    if i is 5 then next repeat

    repeat with i = 1 to 10
      exit repeat
    end repeat
  end if
end myPrivateCommand


private on myPrivateMessage
  try
    put 1 / 0
  catch e
    put "that didn't work so well"
  end try

  throw "it worked" && "!"
end myPrivateMessage


on mouseUp pBtnNum
  answer param(0) && pBtnNum
end mouseUp


before mouseUp pBtnNum
  answer param(0) && pBtnNum
end mouseUp


after mouseUp pBtnNum
  answer param(0) && pBtnNum
end mouseUp

/**
 The following examples are edge cases. These examples all compile
 but the formatting may be a little strange.
 */
on mouseUp
  beep
  makeSomething
end mouseUp

on makeSomething
  local a
  local b
  local c
  local D

  put "a" into a
  put "b" into b
  if a = b then put "c"
  else if  D = D then
     put "d = d"
  else
     put "last else"
  end if

  if a then put c
  if c then put a

  if a then
     if b then
     else
     end if
  else
  end if


  if a then
     doSomething
  else put a

  if a then
     doSomething
  else if d then put c

  if a then doSomething else if d then put c

  if a then doSomething
  else if d then put c

  if a
  then
     put a
     put b
     put c
  end if

  if a
  then
     put a
  else
     put b
  end if

  if a then
     if b then get c else get d
     else
        doSomethingElse
     end if

  end makeSomething


on mouseDown/*ca */
  local a
  local f
  local b
  local aLIne

  if aLine contains "/*" and aLine contains not "*/" then -- test

  end if

  /*aösfd */

  put "beep"
  put "a" into a
  put "b" into f
  if a = f then # comment  \
        put "--"; put "h" \
        put "#" \
        put "*"  \
        put "*"
  if f = 1 then
  end if
  --    /*what is going on
  --    --end if
  --    here*/
else
  put "a"
end if
if a is not b then beep
end mouseDown


on mouseMove
  local a
  local d
  if a < d then
     --beep
  end if
end mouseMove

getprop myProp[begin]
  beep
end myProp

on doSomethingElse

end doSomethingElse
