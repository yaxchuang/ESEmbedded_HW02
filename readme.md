HW02
===
This is the hw02 sample. Please follow the steps below.

# Build the Sample Program

1. Fork this repo to your own github account.

2. Clone the repo that you just forked.

3. Under the hw02 dir, use:

	* `make` to build.

	* `make clean` to clean the ouput files.

4. Extract `gnu-mcu-eclipse-qemu.zip` into hw02 dir. Under the path of hw02, start emulation with `make qemu`.

	See [Lecture 02 ─ Emulation with QEMU] for more details.

5. The sample is designed to help you to distinguish the main difference between the `b` and the `bl` instructions.  

	See [ESEmbedded_HW02_Example] for knowing how to do the observation and how to use markdown for taking notes.

# Build Your Own Program

1. Edit main.s.

2. Make and run like the steps above.

# HW02 Requirements

1. Please modify main.s to observe the `push` and the `pop` instructions:  

	Does the order of the registers in the `push` and the `pop` instructions affect the excution results?  

	For example, will `push {r0, r1, r2}` and `push {r2, r0, r1}` act in the same way?  

	Which register will be pushed into the stack first?

2. You have to state how you designed the observation (code), and how you performed it.  

	Just like how [ESEmbedded_HW02_Example] did.

3. If there are any official data that define the rules, you can also use them as references.

4. Push your repo to your github. (Use .gitignore to exclude the output files like object files or executable files and the qemu bin folder)

[Lecture 02 ─ Emulation with QEMU]: http://www.nc.es.ncku.edu.tw/course/embedded/02/#Emulation-with-QEMU
[ESEmbedded_HW02_Example]: https://github.com/vwxyzjimmy/ESEmbedded_HW02_Example

--------------------

- [ ] **If you volunteer to give the presentation next week, check this.**
--------------------

Please take your note here.

1. 先將資料夾 gnu-mcu-eclipse-qemu 複製到 ESEmbedded_HW02 資料夾中
2. 設計測試程式 main.s ，從 _start 開始後依序執行 push 以及 pop 並且觀察其指令差異， 目標比較 18 行的 `push {r0, r1, r2}` 以及 20 行的 `push {r2, r0, r1}` 執行時的變化。

main.s:

```assembly
_start:
	nop
        
        //mov
        mov r0, #100
        mov r1, #0x11000000
        mov r2, #102
        mov r3, #103

        //push
	push {r0, r1, r2}
        pop  {r2}
        push {r2, r0, r1}
        pop  {r0}
  
label01:
	nop

	//
	//branch w/ link
	//
	bl	sleep

sleep:
	nop
	b	.
```
3. 將 main.s 編譯並以 qemu 模擬， 先$ make clean, 再$ make, $ make qemu 完開啟另一 Terminal 連線 $ arm-none-eabi-gdb ，再輸入 target remote 127.0.0.1:1234 連接，輸入兩次的 ctrl + x 再輸入 2或是輸入layout regs, 開啟 Register 以及指令，並且輸入display $sp接著再輸入 si 單步執行觀察。 當執行完 push {r0, r1, r2} 時， pc 跳轉從 0x1a 至 0x1c 且 sp 從 0x20000100 至 0x200000f4。
![](https://github.com/yaxchuang/ESEmbedded_HW02/blob/master/img/push{r0,r1,r2}.png)

