I first added some tests, here I discovered a documentation bug, the generated
file have no **'_'** before the **\[kind\]** part. I've chosen to follow fixing
documentation (not the implementation).

I fix documentation position and added some tags for YARD.

Then I refactored the code:

- Changed the string concatenation for a joined array (easier to maintain and faster)
- Made methods for complex parts: random_chars, age, title truncation.
- Simplified title truncation and swap the gsub/downcase part to use a simplier
regular expression.

## Notes ##

There may be an incorrect solution to fix documentation instead of
implementation in certain cases, it depends on which is correct.

Conventions are lacking in the use of `target.personal?`, it should be implemented like `target.kind_of? :personal`.

