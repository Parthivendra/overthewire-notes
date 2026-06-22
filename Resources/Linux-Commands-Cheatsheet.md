**Arguments, Files, Standard Input (stdin), and Pipes**

Unix commands can receive data in different ways.

### 1. Arguments
Data is passed directly on the command line.

**Example:**
```bash
echo hello
```
Here, `"hello"` is an argument.

### 2. Files
Some commands can open and read files themselves.

**Example:**
```bash
grep "millionth" data.txt
```

**Arguments:**
- `"millionth"`
- `data.txt`

`grep` reads the contents of `data.txt` internally.

### 3. Standard Input (stdin)
Many commands expect data to be fed into them.

**Example:**
```bash
tr 'a-z' 'A-Z'
```
`tr` waits for input from stdin.

### 4. Pipes (`|`)
Connect the stdout of one command to the stdin of another.

**Example:**
```bash
cat data.txt | tr 'a-z' 'A-Z'
```

**Data flow:**
```
data.txt
   ↓
  cat
   ↓ (stdout)
  pipe
   ↓ (stdin)
   tr
   ↓
 output
```

### Key Insight
Before using a command, ask:

- Does it expect **arguments**?
- Does it read **files** directly?
- Does it expect **stdin**?

### Examples
```bash
cat file.txt
```
→ `cat` expects filenames.

```bash
grep "word" file.txt
```
→ `grep` can read files directly.

```bash
tr 'a-z' 'A-Z'
```
→ `tr` expects stdin.

### Common Mistake
Confusing a **filename** with the **contents** of a file.

`data.txt`  
is the **name** of a file.

`cat data.txt`  
produces the **contents** of that file.

These are **not** the same thing.