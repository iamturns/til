vim
===

```
h = move left
j = move down
k = move up
l = move right

w = move to start of next word
e = move to end of word
b = move to beginning of word

2[movement key] = do movement 2 times
3igo Esc = insert 'go' 3 times

f[character] = move to next character occurance
3fq = third occurrance of 'q'

(, {, [, % = jump to matching parenthesis

0 = start of line
$ = end of line

* = find next match of word under cursor
# = find previous match of word under cursor

gg = beginning of file
G = end of file
[line number]G = go to line number

/[search term]
n = next search item
N = previous search item

o = insert new line and go into insert mode
O = same as above, but inserts before current line

x = delete character under cursor
X = delete character to left of cursor

r = remove current character, and go into insert mode

d = delete, combine with movement characters
Examples:
- dw = delete word
- 2dw = delete 2 words

Also copies deleted word to clipboard

p = paste
. = repeat previous command
v = visual mode, can select things

:w = write / save
:q = quit
:q! = quit without saving

u = undo
ctrl+R = redo
```