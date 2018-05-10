-- SYNTAX TEST "Packages/LiveCode/LiveCode.sublime-syntax"
script "LiveCode Sublime Text Language Module Example Stack"
--^^^^ keyword.script.name.livecode
--     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string
--                                                          ^ - string

global gGlobalVar # no variable assignemnt allowed for globals
-- <- storage.modifier.livecode
--^^^^ storage.modifier.livecode
--     ^^^^^^^^^^ variable.other.livecode
--    ^ - storage - variable
--               ^ - variable - comment
--                ^ punctuation.definition.comment.livecode
--                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line.hash.livecode
global gGlobalVar2 -- just a variable for testing
-- <- - comment
-- <- storage.modifier.livecode
--^^^^ storage.modifier.livecode
--     ^^^^^^^^^^^ variable.other.livecode
--    ^ - storage - variable
--                ^ - variable - comment
--                 ^^ punctuation.definition.comment.livecode
--                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line.double-dash.livecode

local sLocalVar = true /* Default to true */
-- <- storage.modifier.livecode
--^^^ storage.modifier.livecode
--    ^^^^^^^^^ variable.other.livecode
--   ^ - storage - variable
--             ^ - storage - variable - constant - keyword
--              ^ keyword.operator.assignment.livecode
--               ^ - storage - variable - constant - keyword
--                ^^^^ constant.language.livecode
--                    ^ - storage - variable - constant - keyword - comment
--                     ^^ punctuation.definition.comment.begin.livecode
--                     ^^^^^^^^^^^^^^^^^^^^^ comment.block.livecode
--                                        ^^ punctuation.definition.comment.end.livecode
--                                          ^ - comment
local sLocalVar2 = "a value"
-- <- storage.modifier.livecode
--^^^ storage.modifier.livecode
--    ^^^^^^^^^^ variable.other.livecode
--   ^ - storage - variable
--              ^ - storage - variable - constant - keyword
--               ^ keyword.operator.assignment.livecode
--                ^ - storage - variable - constant - keyword
--                 ^ punctuation.definition.string.begin.livecode
--                 ^^^^^^^^^ string.quoted.double.livecode
--                         ^ punctuation.definition.string.end.livecode
--                          ^ - string

constant kConstant = red
-- <- storage.modifier.livecode
--^^^^^^ storage.modifier.livecode
--       ^^^^^^^^^ entity.name.constant.livecode
--      ^ - storage - variable - entity
--                ^ - storage - variable - constant - keyword - entity
--                 ^ keyword.operator.assignment.livecode
--                  ^ - storage - variable - constant - keyword - entity
constant kConstant2 = "some value"
-- <- storage.modifier.livecode
--^^^^^^ storage.modifier.livecode
--       ^^^^^^^^^^ entity.name.constant.livecode
--      ^ - storage - variable - entity
--                 ^ - storage - variable - constant - keyword - entity
--                  ^ keyword.operator.assignment.livecode
--                   ^ - storage - variable - constant - keyword - entity - string
--                    ^ punctuation.definition.string.begin.livecode
--                    ^^^^^^^^^^^^ string.quoted.double.livecode
--                               ^ punctuation.definition.string.end.livecode
--                                ^ - string

local noAssignment
-- <- storage.modifier.livecode
--^^^ storage.modifier.livecode
--    ^^^^^^^^^^^^ variable.other.livecode

local var1, var2
-- <- storage.modifier.livecode
--^^^ storage.modifier.livecode
--    ^^^^ variable.other.livecode
--        ^ punctuation.separator.variable-declaration.livecode
--        ^^ - variable - illegal
--          ^^^^ variable.other.livecode

local var3,
-- <- storage.modifier.livecode
--^^^ storage.modifier.livecode
--    ^^^^ variable.other.livecode
--        ^ punctuation.separator.variable-declaration.livecode
--         ^ invalid.illegal.expected-identifier.livecode

local var4, var5, var6 -- comment
-- <- storage.modifier.livecode
--^^^ storage.modifier.livecode
--    ^^^^ variable.other.livecode
--        ^ punctuation.separator.variable-declaration.livecode
--        ^^ - variable - illegal
--          ^^^^ variable.other.livecode
--              ^ punctuation.separator.variable-declaration.livecode
--              ^^ - variable - illegal
--                     ^^^^^^^^^^^ comment

on libraryStack
-- <- keyword.control.function.begin.livecode
-- ^^^^^^^^^^^^ entity.name.function.begin.livecode
--^ - entity - keyword
--             ^ - entity
-- <- meta.function.livecode
  if the short name of the target is not me then pass libraryStack
--^^ keyword.control.flow.livecode
--  ^ - keyword
--                                         ^ - keyword
--                                          ^^^^ keyword.control.flow.livecode
--                                              ^ - keyword
--   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.between-if-and-then.livecode
--                                              ^^^^^^^^^^^^^^^^^^ meta.if.line.livecode - meta.between-if-and-then.livecode
--                                                                ^ - meta.if.line.livecode
  
  /* This is a 
--^^ punctuation.definition.comment.begin.livecode
--^^^^^^^^^^^^^ comment.block.livecode
  multiline comment
--^^^^^^^^^^^^^^^^^^ comment.block.livecode
  */
--^^ comment.block.livecode
--^^ punctuation.definition.comment.end.livecode
--  ^ - comment - punctuation
  
  put "The \ character is the " & \
--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.livecode
--^^^ keyword
--    ^^^^^^^^^^^^^^^^^^^^^^^^^ string
--         ^ - punctuation
--                              ^ keyword.operator.livecode - string
--                                ^ punctuation.separator.continuation.line.livecode
                                    "line continuation character" into tVar
--                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string
--                                                                ^^^^ keyword - string
--                                                                    ^ - variable
--                                                                     ^^^^ variable.other.livecode
--                                                                         ^ - variable
  
end libraryStack
-- <- keyword.control.function.end.livecode
--  ^^^^^^^^^^^^ entity.name.function.end.livecode
--              ^ - keyword - entity - meta

setProp uCustomProp pValue
-- <- keyword.control.function.property.begin.livecode
--^^^^^ keyword.control.function.property.begin.livecode
--     ^ - keyword - entity
--      ^^^^^^^^^^^ entity.name.function.property.begin.livecode
--                 ^ - entity
--                  ^^^^^^ variable.parameter.livecode
--                        ^ - variable
  put pValue into sLocalVar
--^^^ keyword
--           ^^^^ keyword
--                ^^^^^^^^^ variable.other.livecode
--^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.livecode
end uCustomProp
-- <- keyword.control.function.property.end.livecode
--  ^^^^^^^^^^^ entity.name.function.property.end.livecode
--             ^ - meta

setProp uCustomProp2[pCategory] pValue
-- <- keyword.control.function.property.begin.livecode
--^^^^^ keyword.control.function.property.begin.livecode
--     ^ - keyword - entity
--      ^^^^^^^^^^^^ entity.name.function.property.begin.livecode
--                  ^ punctuation.definition.property.begin.livecode - entity
--                   ^^^^^^^^^ variable.parameter.livecode
--                            ^ punctuation.definition.property.end.livecode
--                              ^^^^^^ variable.parameter.livecode

  set the uCustomProp2[pCategory] of me to pValue
--        ^^^^^^^^^^^^ variable.other.livecode
--                     ^^^^^^^^^ meta.item-access.livecode
--                    ^ punctuation.definition.key.begin.livecode
--                              ^ punctuation.definition.key.end.livecode
--                                   ^^ variable.language.livecode
  
  # line continuation.
--^^^^^^^^^^^^^^^^^^^^^ comment
  # This:
--^^^^^^^^ comment
  if "1" is 1 then \
        return "something"
  else \
        return "something else"
  
  # Is the same as this:
--^^^^^^^^^^^^^^^^^^^^^^^ comment
  if "1" is 1 then return "something"
--^^ keyword.control.flow.livecode
--   ^^^ string
--       ^^ keyword.operator.livecode
--          ^ constant.numeric.livecode
--            ^^^^ keyword.control.flow.livecode
--                        ^^^^^^^^^^^ string.quoted.double.livecode
  else return "something else"
--^^^^ keyword.control.flow.livecode
--            ^^^^^^^^^^^^^^^^ string.quoted.double.livecode
end uCustomProp2
-- <- keyword.control.function.property.end.livecode
--  ^^^^^^^^^^^^ entity.name.function.property.end.livecode

getProp myCustomProp
-- <- keyword.control.function.property.begin.livecode
--      ^^^^^^^^^^^^ entity.name.function.property.begin.livecode
  return the myCustomProp2["test"] of me
--           ^^^^^^^^^^^^^ variable.other.livecode
--                        ^ punctuation.definition.key.begin.livecode
--                               ^ punctuation.definition.key.end.livecode
--                         ^^^^^^ meta.item-access.livecode string
end myCustomProp
--^ keyword.control.function.property.end.livecode
--  ^^^^^^^^^^^^ entity.name.function.property.end.livecode

getProp myCustomProp2 [pKey]
--^^^^^ keyword.control.function.property.begin.livecode
--      ^^^^^^^^^^^^^ entity.name.function.property.begin.livecode
--                    ^ punctuation.definition.property.begin.livecode
--                         ^ punctuation.definition.property.end.livecode
--                     ^^^^ variable.parameter.livecode
  return sLocalVar[pKey]
--       ^^^^^^^^^ variable.other.livecode
--                 ^^^^ meta.item-access.livecode
--                ^ punctuation.definition.key.begin.livecode
--                     ^ punctuation.definition.key.end.livecode

end myCustomProp2
--  ^^^^^^^^^^^^^ entity.name.function.property.end.livecode

function myFunction pParam1, @rParam2
--^^^^^^ keyword.control.function.begin.livecode
--       ^^^^^^^^^^ entity.name.function.begin.livecode
--                  ^^^^^^^ variable.parameter.livecode
--                         ^ punctuation.separator.parameter.livecode - variable
--                           ^^^^^^^^ variable.parameter.livecode
  if true then
--^^ keyword.control.flow.livecode
--   ^^^^ constant.language.livecode
--        ^^^^ keyword.control.flow.livecode
--            ^ meta.if.block.livecode
  else if false then
--^^^^^^^ keyword.control.flow.livecode
--        ^^^^^ constant.language.livecode
--              ^^^^ keyword.control.flow.livecode
--                  ^ meta.if.block.livecode
  else
--^^^^ keyword.control.flow.livecode
--^^^^^ meta.if.block.livecode
  end if
--^^^^^^ keyword.control.flow.livecode
--      ^ - meta.if
  
  switch pParam1
--^^^^^^ keyword.control.flow.livecode
    case "1"
--^^^^^^^^^^^ meta.switch.block.livecode
--  ^^^^ keyword.control.flow.livecode
--       ^^^ string
      
      break
--    ^^^^^ keyword.control.flow.livecode
    case "2"
--^^^^^^^^^^^ meta.switch.block.livecode
--  ^^^^ keyword.control.flow.livecode
--       ^^^ string
      
      break
--    ^^^^^ keyword.control.flow.livecode
    case 3
--^^^^^^^^^^^ meta.switch.block.livecode
--  ^^^^ keyword.control.flow.livecode
--       ^ constant.numeric.livecode
      
      break
--    ^^^^^ keyword.control.flow.livecode
    default
--  ^^^^^^^ keyword.control.flow.livecode
      return "test" for value
--           ^^^^^^ string
  end switch
--^^^^^^^^^^ keyword.control.flow.livecode
--          ^ - meta.switch.block.livecode
  
  return myPrivateFunction(pParam1, rParam2)
--       ^^^^^^^^^^^^^^^^^ variable.function.livecode
--       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function-call.livecode
--                         ^^^^^^^^^^^^^^^^ meta.parameters.livecode
--                        ^ punctuation.section.parameters.begin.livecode
--                                         ^ punctuation.section.parameters.end.livecode
--                                ^ punctuation.separator.parameters.livecode
end myFunction
--^ keyword.control.function.end.livecode
--  ^^^^^^^^^^ entity.name.function.end.livecode


command myCommand
-- <- keyword.control.function.begin.livecode
--^^^^^ keyword.control.function.begin.livecode
--      ^^^^^^^^^ entity.name.function.begin.livecode
  local tError
--^^^^^ storage.modifier.livecode
--      ^^^^^^ variable.other.livecode
  
  if 1 is "1" then return "nothing" # a comment
--^^ keyword.control.flow.livecode
--     ^^ keyword.operator.livecode
--                                  ^^^^^^^^^^^^ comment
  
  myPrivateCommand pParama
  put the result into tError
--^^^ keyword
--    ^^^^^^^^^^ variable.language.livecode
--               ^^^^ keyword
--                    variable.other
  
  return tError for error
end myCommand
--^ keyword.control.function.end.livecode
--  ^^^^^^^^^ entity.name.function.end.livecode

private function myPrivateFunction pParam1, @xParam2
--^^^^^ storage.modifier.livecode
--      ^^^^^^^^ keyword.control.function.begin.livecode
--               ^^^^^^^^^^^^^^^^^ entity.name.function.begin.livecode
--                                 ^^^^^^^ variable.parameter.livecode
--                                        ^ punctuation.separator.parameter.livecode
--                                          ^^^^^^^^ variable.parameter.livecode

  # with counterVar = startvalue to endvalue
  repeat with i = 1 to the number of elements of tArray
--^^^^^^^^^^^ keyword.control.flow.livecode
--            ^ variable.other.livecode
--              ^ keyword.operator.assignment.livecode
--                ^ constant.numeric.livecode
--                     ^^^^^^^^^^^^^^^^^^^^^^^^^ variable.language.livecode
    if i = 1 then
      next repeat
--    ^^^^^^^^^^^ keyword.control.flow.livecode
    else
      exit repeat
--    ^^^^^^^^^^^ keyword.control.flow.livecode
    end if
  end repeat
--^^^^^^^^^^ keyword.control.flow.livecode
  
  # with counterVar = startvalue to endvalue step x
  repeat with i = 1 to 20 step 2
--^^^^^^^^^^^ keyword.control.flow.livecode
--            ^ variable.other.livecode
--              ^ keyword.operator.assignment.livecode
--                ^ constant.numeric.livecode
--                     ^^ constant.numeric.livecode
--                             ^ constant.numeric.livecode
    
  end repeat
--^^^^^^^^^^ keyword.control.flow.livecode
  
  # with counterVar = startvalue down to endvalue
  repeat with i = 20 down to 10
--^^^^^^^^^^^ keyword.control.flow.livecode
--            ^ variable.other.livecode
--              ^ keyword.operator.assignment.livecode
--                ^ constant.numeric.livecode
--                           ^^ constant.numeric.livecode

    subtract 1 from j
  end repeat
--^^^^^^^^^^ keyword.control.flow.livecode
  
  # repeat x times
  repeat 2 times
--^^^^^^ keyword.control.flow.livecode
--       ^ constant.numeric.livecode
--         ^^^^^ keyword.control.flow.livecode
    add 1 to i
  end repeat
--^^^^^^^^^^ keyword.control.flow.livecode
  
  # repeat forever
  repeat forever
--^^^^^^^^^^^^^^ keyword.control.flow.livecode
    add 1 to i
    if i > 100 then exit repeat
--  ^^ keyword.control.flow.livecode
--             ^^^^ keyword.control.flow.livecode
--                  ^^^^^^^^^^^ keyword.control.flow.livecode
  end repeat
--^^^^^^^^^^ keyword.control.flow.livecode
  
  -- repeat while
  repeat while x < 2
--^^^^^^^^^^^^ keyword.control.flow.livecode
--               ^ keyword.operator.livecode
--                 ^ constant.numeric.livecode
    add 1 to x
  end repeat
--^^^^^^^^^^ keyword.control.flow.livecode
  
  # repeat until
  put 0 into x
  repeat until x > 3
--^^^^^^^^^^^^ keyword.control.flow.livecode
--               ^ keyword.operator.livecode
--                 ^ constant.numeric.livecode
    add 1 to x
  end repeat
--^^^^^^^^^^ keyword.control.flow.livecode
  
  repeat for each item tItem in tList
--^^^^^^^^^^^^^^^ keyword.control.flow.livecode
    add 1 to x
  end repeat
  
  repeat for each key tKey in tArray
    put tKey & ":" && tArray[tKey] & cr after tVar
  end repeat
  
  repeat for each element tElement in tArray
    
  end repeat
end myPrivateFunction


private command myPrivateCommand pParam1
  if 1 is 1 then
    if i is 5 then next repeat
    
    repeat with i = 1 to 10
      exit repeat
    end repeat
  end if
end myPrivateCommand


private on myPrivateMessage
  try
--^^^ keyword.control.flow.livecode
    put 1 / 0
  catch e
--^^^^^ keyword.control.flow.livecode
--      ^ variable.other.livecode
    put "that didn't work so well"
  finally
--^^^^^^^ keyword.control.flow.livecode
  end try
--^^^^^^^ keyword.control.flow.livecode
  
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
--^^^^ keyword.control.flow.livecode
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
--^^^^^^^^^^^^^^ comment
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
--^^^^^ keyword.control.function.property.begin.livecode
  beep
end myProp

on doSomethingElse

end doSomethingElse

ask "Do you want gravy?"; if it is "OK" then putGravyOnPotatoes # compound line
--                      ^ punctuation.terminator
--                        ^^ keyword.control.flow
--                           ^^ keyword.other
--                              ^^ keyword.operator
--                                 ^^^^ string.quoted.double
--                                      ^^^^ keyword.control.flow
--                                                              ^^^^^^^^^^^^^^^^ comment.line
