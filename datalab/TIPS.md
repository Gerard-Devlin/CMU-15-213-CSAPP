

[TOC]

---

## 一、测评

`btest`：用于测试你的函数是否正确。仅在一个小的测试集上进行测试，不能完全保证你的函数是正确的。

```bash
# 编译并运行
make && ./btest
# 对某个函数进行单元测试
make && ./btest -f bitXnor
# 对某个函数进行单元测试，且指定测试用例，以 -1 指定第一个参数，依次类推
make && ./btest -f bitXnor -1 7 -2 0xf
```

注意，这里的 `make` 是必需的，每当你修改了 `bits.c`，都需要重新编译

`dlc`：用于检查你的代码是否符合规范。

```bash
# 检查是否符合编码规范
./dlc bits.c
```

`bdd checker`：穷举测试所有可能的输入，完整地检查你的函数是否正确。

```bash
# 对某个函数进行单元测试
./bddcheck/check.pl -f bitXnor
# 检查所有函数
./bddcheck/check.pl
# 检查所有函数，且输出总结信息
./bddcheck/check.pl -g
```

`driver.pl`：用于评分，检查你的函数是否符合规范且正确。

```bash
./driver.pl
```

---

## 二、辅助工具

要使用辅助工具，你必须先编译：

```bash
make
```

bash

`ishow`：用于显示整数的二进制形式。

```bash
# 显示 -1 的二进制形式
./ishow -1
# Hex = 0xffffffff,       Signed = -1,    Unsigned = 4294967295

# 以 0x 开头，十六进制表示转整数
./ishow 0xffffffff
# Hex = 0xffffffff,       Signed = -1,    Unsigned = 4294967295
```

`fshow`：用于显示浮点数的二进制形式。

```bash
# 带小数点，浮点数转表示
./fshow 12.0
# Floating point value 12
# Bit Representation 0x41400000, sign = 0, exponent = 0x82, fraction = 0x400000
# Normalized.  +1.5000000000 X 2^(3)

# 不带小数点，表示转浮点数
./fshow 12
# Floating point value 1.681558157e-44
# Bit Representation 0x0000000c, sign = 0, exponent = 0x00, fraction = 0x00000c
# Denormalized.  +0.0000014305 X 2^(-126)

# 不带小数点，以 0x 开头，十六进制表示转浮点数
./fshow 0x41400000
# Floating point value 12
# Bit Representation 0x41400000, sign = 0, exponent = 0x82, fraction = 0x400000
# Normalized.  +1.5000000000 X 2^(3)
```