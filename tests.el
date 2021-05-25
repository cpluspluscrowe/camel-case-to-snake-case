(ert-deftest 
    camel-to-snake
    ()
  "should convert a camel case word to snake-case"
  (should (equal (camel-to-snake "thisIsCamel") "this-is-camel")) 
  (should (equal (camel-to-snake-2 "thisIsCamel") "this-is-camel")))
