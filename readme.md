# 🧠 libasm — Hobby Project for Learning Assembly

> This is a personal hobby project created to **learn and practice low-level programming** using **x86_64 Assembly (NASM)**.  
> The goal is to reimplement a set of basic functions from the C standard library and understand how they work under the hood.

---

## 📚 Purpose

This project was made **for educational purposes only**.  
I wanted to explore how functions in the C standard library are implemented at the assembly level, and how compilers interact with lower-level code.

---

## 🧪 Features

Currently implemented functions (x86_64):

| Function        | Description                        |
|-----------------|------------------------------------|
| `ft_isalpha`    | Checks for alphabetic character    |
| `ft_isdigit`    | Checks for digit (0–9)             |
| `ft_isalnum`    | Checks for alphanumeric character  |
| `ft_isascii`    | Checks if character is ASCII       |
| `ft_islower`    | Checks for lowercase letter        |
| `ft_isupper`    | Checks for uppercase letter        |
| `ft_strlen`     | Checks for string length           |

---

## ⚙️ Tools Used

- **NASM** — Netwide Assembler for writing x86_64 assembly
- **GCC** — Compiler used to link and test the assembly code
- **Make** — Automates the build process
- **Shell Script** — For simple test automation

---

## 🧰 Requirements

To build and run this project, you need:

- ✅ **Linux** or **macOS** (x86_64 architecture)
- ✅ `nasm` installed  
  You can install via package manager:

  ```bash

  # For Ubuntu/Debian
  sudo apt install nasm
  
  # For Fedora
  sudo dnf install nasm

  # For macOS (with Homebrew)
  brew install nasm ```

* ✅ `gcc` installed
* ✅ `make` utility

---

## 🔨 How to Build

```bash
make            # Build shared library
make re         # Rebuild everything
make fclean     # Clean all build files
```

---

## 🧪 How to Test

```bash
./test.sh       # Run test script
```

Or manually:

```bash
gcc -Iinclude test/main.c -L. -lasm -o test.out
./test.out
```

---

## 📁 Project Structure

```
libasm/
├── include/
│   └── libasm.h          # Header file for external usage
├── src/
│   ├── *.asm             # Assembly source files
├── test/
│   └── main.c            # Test program written in C
├── test.sh               # Simple test runner
├── makefile              # Build script

```

---

## 👨‍💻 Author

**uphokaew (B)** 🐝
A student passionate about systems programming and sleeping.
This project is part of my self-learning journey into low-level development.

---

## 💬 Notes

This project may expand over time to include more functions or optimizations.
Any suggestions, feedback, or collaborations from fellow learners are welcome!

---
