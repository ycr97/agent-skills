# Examples

These examples illustrate activation, non-activation, and the intended interaction pattern.

## Activate — deep technical learning

User:

> 学习：为什么 TCP 是字节流协议，却仍然可以实现可靠传输？

Expected behavior:

1. Extract the governing principle behind reliable ordered byte delivery.
2. Build from packet loss, reordering, sequence space, acknowledgements, retransmission, and receive buffering.
3. Separate the byte-stream abstraction from the packet-level transport mechanism.
4. Test a likely misconception such as "one send equals one receive".
5. Give a prediction/application problem before fully closing the lesson.

## Activate — mechanism understanding

User:

> 我会用 MySQL 索引，但一直没有真正理解为什么 B+Tree 比红黑树更适合作为磁盘索引，教我吃透。

Expected behavior:

Start from storage hierarchy and I/O cost, not from memorized data-structure definitions. Progress toward fan-out, tree height, page locality, range scans, and workload implications.

## Activate — skill mastery

User:

> 教我从网络基础一路理解到能自己写一个 TCP tunnel，不要只给教程步骤。

Expected behavior:

Treat this as a staged learning path. Diagnose prerequisites, teach governing network principles, and use increasingly realistic implementation exercises.

## Do not activate — simple lookup

User:

> TCP 默认端口是多少？

Expected behavior:

Answer the factual request directly. Do not launch a teaching protocol unless the user asks to learn the surrounding concept.

## Do not over-teach

User:

> B+Tree 和 B-Tree 最大区别，一句话。

Expected behavior:

Respect the requested brevity. The skill should not force a long lesson.
