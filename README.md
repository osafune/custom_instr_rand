rand_xorshift128
================

QsysでNiosIIにランダム値取得命令を提供するカスタム命令です。


使い方
======

1. componentフォルダ以下をQsysのライブラリパスが通るところへコピーします。
2. QsysにAddしてNiosIIのカスタム命令バスに接続します。
3. C/C++からは引数無しのカスタム命令として動作します。ランダム値生成ロジックは内部で自走しているため、クロック単位で一致させない限りソフトウェアでの再現性はありません。


ライセンス
=========

[Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0)
