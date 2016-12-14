-- SYNTAX TEST "Packages/LiveCode/LiveCode.sublime-syntax"

global gGlobalVar # no variable assignemnt allowed for globals
-- <- storage.modifier.livecode
--^^^^ storage.modifier.livecode
--     ^^^^^^^^^^ variable.other.livecode
--    ^ - storage - variable
--               ^ - variable - comment
--                ^ punctuation.definition.comment.livecode
--                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line.hash.livecode


function myFunction
  return tOutput
--           ^^^ - keyword
end myFunction
--^ keyword.control.function.end.livecode
--  ^^^^^^^^^^ entity.name.function.end.livecode
