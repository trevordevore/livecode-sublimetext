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

command processParams
  put ($# - 1) into tVar
--    ^ punctuation.section.group.begin.livecode
--     ^^ variable.language.livecode
--       ^ - variable
--      ^^^^^^^^^^^^^^^^^ - comment 
--           ^ punctuation.section.group.end.livecode
  )
--^ invalid.illegal.stray-bracket.livecode

  put abc(def
  
  put (unclosedParen
  
end processParams
--^ keyword.control.function.end.livecode
